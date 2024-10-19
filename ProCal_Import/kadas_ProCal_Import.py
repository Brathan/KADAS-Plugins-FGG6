from PyQt5.QtCore import *
#from PyQt5.QtCore import QFileInfo, QSettings
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *

from kadas.kadascore import *
from kadas.kadasgui import *
from kadas.kadasanalysis import *

from qgis.core import QgsRasterLayer, QgsProject, QgsColorRampShader, QgsSingleBandPseudoColorRenderer, QgsRasterShader
from qgis.PyQt.QtWidgets import QFileDialog

import os
import csv
import numpy as np
from PIL import Image
from osgeo import gdal, osr


class KadasExample(QObject):

    def __init__(self, iface):
        QObject.__init__(self)

        print( '***************************Konstruktor ProCal Import Plugin**************************' )
        self.plugin_dir = os.path.dirname(__file__)
        self.iface = KadasPluginInterface.cast(iface)

    def initGui(self):
        self.exampleAction = QAction(QIcon(self.tr(self.plugin_dir) + "/icons/ProCal.ico"), self.tr("ProCal Import"))
        self.exampleAction.triggered.connect(self.__run)
        self.iface.addAction(self.exampleAction, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")

    def unload(self):
        self.iface.removeAction( self.exampleAction, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")

    def __run(self):
        def save_greyscale_tiff(image_data, path, transform, crs_epsg=2056):
            # Create a greyscale image using PIL
            image = Image.fromarray(image_data, mode='L')
            image.save(path, format='TIFF')

            # Open the saved TIFF image using GDAL
            existing_ds = gdal.Open(path, gdal.GA_Update)

            # Set the spatial reference (CRS)
            crs = osr.SpatialReference()
            crs.ImportFromEPSG(crs_epsg)
            existing_ds.SetProjection(crs.ExportToWkt())

            # Set the geotransformation
            existing_ds.SetGeoTransform(transform)

            # Flush changes and close the dataset
            existing_ds = None
            print(f"Saved and georeferenced image: {path}")
    
        # Define the expected headers for the CSV file
        expected_headers = ['I', 'Lat CH', 'Long CH', 'Value [DBM]']

        # Function to validate the structure of the selected CSV file
        def validate_csv_structure(input_file):
            with open(input_file, 'r') as csvfile:
                reader = csv.DictReader(csvfile, delimiter=';')
                selected_headers = reader.fieldnames
                print(selected_headers)
                print()
            return selected_headers == expected_headers
        
        # Open the file dialog to select a csv file
        projectPath = QgsProject.instance().absolutePath() + '/'
        inputFile, _ = QFileDialog.getOpenFileName(None, "Select ProCal Export", projectPath, "(*.csv)")

        print(projectPath)

        # Check if a file was selected
        if not inputFile:
            QMessageBox.warning(None, "No File Selected", "Please select a file to proceed.")
            return  # Exit the function if no file was selected

        # Validate the structure of the selected file
        if not validate_csv_structure(inputFile):
            QMessageBox.warning(None, "Invalid File Structure", "The selected file does not match the required structure.")
            return  # Exit the function if the structure doesn't match
        
        # Proceed if a file was selected
        print(inputFile)
        fileInfo = QFileInfo(inputFile)
        fileName = fileInfo.fileName()
        baseName = fileInfo.baseName()
        directory_path = fileInfo.dir().absolutePath()

        # Create empty lists to store the data
        long_ch = []
        lat_ch = []
        value_dbm = []

        # Read the CSV file
        with open(inputFile, 'r') as csv_file:
            csv_reader = csv.DictReader(csv_file, delimiter=';')
            for row in csv_reader:
                long_ch.append(float('2' + row['Long CH']))
                lat_ch.append(float('1' + row['Lat CH']))
                value_dbm.append(float(row['Value [DBM]']))

        # Calculate the mesh grid size
        uX = np.unique(long_ch)
        uY = np.unique(lat_ch)
        Z = np.array(value_dbm)
        S = [uX.size, uY.size]
        mesh = Z.reshape(S).T

        # Handle any NaN values that might have crept into the mesh
        mesh = np.nan_to_num(mesh, nan=-100.0)

        # Normalize mesh values to 0-255 for greyscale
        normalized_mesh = np.clip((mesh + 100) * 255 / 100, 0, 255).astype(np.uint8)

        # Flip the image vertically to correct the upside-down issue
        normalized_mesh = np.flipud(normalized_mesh)

        # Georeferencing calculations
        maxLong, minLong = max(long_ch), min(long_ch)
        maxLat, minLat = max(lat_ch), min(lat_ch)
        dimLong = maxLong - minLong
        dimLat = maxLat - minLat

        # Calculate the pixel size
        img_height, img_width = normalized_mesh.shape
        pixel_size_x = dimLong / img_width
        pixel_size_y = dimLat / img_height

        # Define the geotransformation
        transform = [minLong, pixel_size_x, 0, maxLat, 0, -pixel_size_y]

        # Save the greyscale TIFF image
        geotif_path = os.path.join(directory_path, f'{baseName}.tif')
        save_greyscale_tiff(normalized_mesh, geotif_path, transform)

        layer = QgsRasterLayer(geotif_path, baseName)
        if not layer.isValid():
            print("Layer failed to load!")

        print("Adding Style...")

        # Adding the layer to the current QGIS project
        QgsProject.instance().addMapLayer(layer)

        # Path to the existing style file (same directory as the CSV file)
        style_file_path = self.tr(self.plugin_dir) + '/ProCalExport_Style.qml'

        # Check if the style file exists
        if os.path.exists(style_file_path):
            # Load the style from the QML file
            layer.loadNamedStyle(style_file_path)
            layer.triggerRepaint()  # Ensure the layer is repainted with the new style
            print(f"Style applied from {style_file_path}")
        else:
            print(f"Style file not found: {style_file_path}")

        # Zoom to the extent of the newly added layer
        self.iface.mapCanvas().setExtent(layer.extent())
        self.iface.mapCanvas().refresh()

        layer.triggerRepaint()

        # Refresh the map canvas
        self.iface.mapCanvas().refresh()

        print("Style applied")


