import shutil
import os
from pathlib import Path
from datetime import datetime

from qgis.PyQt import uic
from qgis.PyQt import QtWidgets
from qgis.PyQt.QtGui import * 
import qgis
from qgis.utils import iface
from qgis.PyQt.QtGui import QColor

from qgis.core import (Qgis,
                       QgsProject,
                       QgsMapLayerType,
                       QgsWkbTypes,
                       QgsMessageLog,
                       QgsLayerTreeGroup,
                       QgsLayerTreeLayer,
                       QgsRasterLayer,
                       QgsVectorLayer,
                       QgsCoordinateReferenceSystem,
                       QgsPalLayerSettings,
                       QgsTextFormat,
                       QgsTextBufferSettings,
                       QgsVectorLayerSimpleLabeling,
                       QgsExpressionContextUtils,
                       QgsMapLayerProxyModel)

from qgis.gui import (QgsMapToolPan)


import processing
from processing.core.Processing import Processing


from .main.AtlasExporter import AtlasExporter
from .main.utilities import Styles, Color



# This loads your .ui file so that PyQt can populate your plugin with the elements from Qt Designer
"""Load UI"""
FORM_CLASS, _ = uic.loadUiType(os.path.join(
    os.path.dirname(__file__),'ui','atlas_dialog_base.ui'))


class FhrRasterATLAS_Dialog(QtWidgets.QDialog, FORM_CLASS):
    def __init__(self, FhrRasterATLAS, parent=None, on_window_close=None, iface=None):
        """Constructor"""
        super(FhrRasterATLAS_Dialog, self).__init__(parent)
        # Set up the user interface from Designer through FORM_CLASS.
        # After self.setupUi() you can access any designer object by doing
        # self.<objectname>, and you can use autoconnect slots - see
        # http://qt-project.org/doc/qt-4.8/designer-using-a-ui-file.html
        # #widgets-and-dialogs-with-auto-connect

        self.iface = iface
        self.setupUi(self)
        self.canvas = self.iface.mapCanvas()
        self.FhrRasterATLAS = FhrRasterATLAS
        self.is_kadas = self.FhrRasterATLAS.is_kadas
        self.set_color_background()
        self.on_window_close = on_window_close
        self.now = self._update_now() 
        self.Styles = Styles(is_kadas=self.is_kadas)
        self.Color = Color(is_kadas=self.is_kadas)
        
        # initialize plugin directory
        self.plugin_dir = os.path.dirname(__file__)
        
       # Init AtlasExporter
        self.Atlas_Exporter = AtlasExporter(dialog=self,progressBar=self.progressBar)
        
        # Init Components
        self.button_close.clicked.connect(self.reject)
        self.pb_create_layout.clicked.connect(self._exportATLAS)
        self.cb_coverageLayer.setFilters(QgsMapLayerProxyModel.PointLayer)
        self.cb_coverageLayer.layerChanged.connect(self._validateLayer)
        self.button_LoadStyle.clicked.connect(self._loadStyle)
        self.button_NewLayer.clicked.connect(self._newLayer)
        self.cb_formatSelector.currentIndexChanged.connect(self._format_changed)
        self.mQgsFileWidget.setFilePath(os.path.join(os.environ['USERPROFILE'], 'Downloads'))
        self.pb_create_layout.setEnabled(False)
        self.progressBar.setVisible(False)
        
        self._validateLayer(self.cb_coverageLayer.currentLayer())
        
        # self.button_close_help.helpRequested.connect(self._help_requested)
        # self.dpi = self.choose_dpi.value()
        # self.choose_dpi.valueChanged.connect(self._dpi_changed)
        # self.rejected.connect(self._remove_grid_layer_from_map)
        # self.set_tooltips()


    def set_tooltips(self):
        # # Combo Boxes
        # self.cb_map_scale.setToolTip("Wähle einen Massstab.\nDas hat einen Einfluss auf die Grösse der Gitterzellen")
        # self.cb_paper_orientation.setToolTip("Wähle eine Papiergrösse und Orientierung.\nDas hat einen Einfluss auf die Grösse UND Ausrichtung der Gitterzellen")
        return

    def reload(self):
        self._empty_labels()

    def _print_info(self):
        print(self)

    def reject(self):
        print("Reject called")
        super().reject()
        self._empty_labels()
        if self.on_window_close is not None:
            self.on_window_close(False)        

    def _help_requested(self):
        self.iface.messageBar().pushMessage(f'Sorry!!! Help not implemented yet ;-)')


    def _update_labels(self):
        pass


    def _update_now(self):
        self.now = datetime.now().strftime('%Y-%m-%d')
        return self.now

    # def _update_file_path(self):
    #     self.download_folder = os.path.join(os.environ['USERPROFILE'], 'Downloads')
    #     # orientation = self.cb_paper_orientation.currentText().replace(' ', '-')
    #     # scale = self.cb_map_scale.currentText()[2:4]
    #     # time = datetime.now().strftime('%H%M%S')
    #     # self.pdf_file_path = os.path.join(self.download_folder, f'{self._update_now()}_{orientation}_{scale}K_{time}.pdf')
    #     return self.download_folder


    def _empty_labels(self):
        """empty labels"""
        # self.label_n_cells.setText('')
        # self.label_pdf_created.setText('')

    def set_color_background(self):
        if self.FhrRasterATLAS.is_kadas:
            self.setStyleSheet('background-color: rgb(255,255,255)')
        else:
            self.setStyleSheet('')
    
    def _newLayer(self):
        print("Adding Layer")

        # Path to your GeoJSON template file
        source_geojson_file_path = os.path.join(self.plugin_dir, 'main', 'templates', 'RasterDefinition.geojson')

        # Get the directory where the current QGIS project is saved
        project_path = QgsProject.instance().fileName()
        if not project_path:
            self.statusText.setTextColor(QColor("red"))
            self.statusText.setText("Project is not saved yet. Please save the project before proceeding.")
            return
        
        # Derive the project directory
        project_dir = os.path.dirname(project_path)

        # Define the destination path where the GeoJSON file will be copied
        destination_geojson_file_path = os.path.join(project_dir, 'RasterDefinition.geojson')

        # Copy the GeoJSON file to the project directory
        try:
            shutil.copy(source_geojson_file_path, destination_geojson_file_path)
            print(f"GeoJSON file copied to {destination_geojson_file_path}")
        except Exception as e:
            print(f"Failed to copy GeoJSON file: {e}")
            return

        # Load the copied GeoJSON file as a vector layer
        geojson_layer = QgsVectorLayer(destination_geojson_file_path, "Raster Definition", "ogr")

        # Check if the layer is valid
        if not geojson_layer.isValid():
            print("Failed to load the GeoJSON file!")
        else:
            # Add the layer to the current QGIS project
            QgsProject.instance().addMapLayer(geojson_layer)
            self._loadStyle(layer=geojson_layer)
            print("GeoJSON layer successfully added to the map.")
            self.statusText.setTextColor(QColor("black"))
            self.statusText.setText(f"- Definition file saved at: {destination_geojson_file_path}")
            # Optional: Zoom to the layer extent
            iface.mapCanvas().setExtent(geojson_layer.extent())
            iface.mapCanvas().refresh()
    
    def _validateLayer(self,layer):
        # Validate layer
        if isinstance(layer, QgsRasterLayer):
            print(f"Coverage layer is a raster layer: {layer.name()}")
            self.statusText.setTextColor(QColor("red"))
            self.statusText.setText("⚠ Unsupported layer type")
            return 0
        elif isinstance(layer, QgsVectorLayer):
            txt = f"Number of features in coverage layer: {layer.featureCount()}"
            self.statusText.setTextColor(QColor("black"))
            self.statusText.setText(txt)
            self.pb_create_layout.setEnabled(True)
            
            return 1
        else:
            self.statusText.setTextColor(QColor("red"))
            self.statusText.setText("Unsupported layer type")
            return 0
    
    def _exportATLAS(self):
        # Disable the entire dialog while exporting
        self.setEnabled(False)
        
        try:
            selectedLayer = self.cb_coverageLayer.currentLayer()
            # Check if the layer is valid and return immediately if not
            if self._validateLayer(selectedLayer) == 0:
                print("Invalid layer or unsupported layer type, export canceled.")
                return  # Exit the function if the validation fails
            
            outPath = self.mQgsFileWidget.filePath()
            # Check if the outPath is valid
            if not os.path.exists(outPath) or not os.path.isdir(outPath):
                self.statusText.setTextColor(QColor("red"))
                self.statusText.setText(" Invalid output directory, export canceled.")
                return  # Exit the function if the output directory is not valid
        
            # Get the selected export format from the combobox as index
            selected_format = self.cb_formatSelector.currentIndex()
    
            if selected_format == 0:
                export_format = '.pdf'
                one_file = True
            elif selected_format == 1:
                export_format = '.pdf'
                one_file = False
            elif selected_format == 2:
                export_format = '.tiff'
                one_file = False
                
            # Retrieve the input fields 
            prefix = self.prefixLineEdit.text() if self.prefixLineEdit else None
            suffix = self.suffixLineEdit.text() if self.suffixLineEdit else None
            filename = self.rasternameLineEdit.text() if self.rasternameLineEdit else None
            
            # Call the AtlasExporter with the selected format, including prefix and suffix
            self.Atlas_Exporter.export(
                coverage_layer=selectedLayer,
                export_format=export_format,
                one_file=one_file,
                output_directory=outPath,
                filename=filename,
                prefix=prefix,
                suffix=suffix)
    
        finally:
            # Re-enable the dialog after the export is done
            self.setEnabled(True)
    
    def _loadStyle(self,layer=None):
        # get selected layer and load style
        layer = self.cb_coverageLayer.currentLayer()
        if self._validateLayer(layer):        
            # Path to the style defintion file
            style_file_path = os.path.join(self.plugin_dir, 'main', 'templates', 'FhrRaster_ATLAS_StyleDef.qml')
            
            # Check if the style file exists
            if os.path.exists(style_file_path):
                # Load the style from the QML file
                layer.loadNamedStyle(style_file_path)
                layer.triggerRepaint()  # Ensure the layer is repainted with the new style
                print(f"Style applied from {style_file_path}")
            else:
                print(f"Style file not found: {style_file_path}")
    
    def _format_changed(self,index):
        # Set visibility of suffix and preffix edit fields
        if index == 0:
            self.prefixLabel.setEnabled(False)
            self.prefixLineEdit.setEnabled(False)
            self.suffixLabel.setEnabled(False)
            self.suffixLineEdit.setEnabled(False)
            self.rasternameLineEdit.setEnabled(True)
            self.rasternameLabel.setEnabled(True)
            self.rasternameLineEdit.setText('FhrRaster')
        elif index > 0:
            self.prefixLabel.setEnabled(True)
            self.prefixLineEdit.setEnabled(True)
            self.suffixLabel.setEnabled(True)
            self.suffixLineEdit.setEnabled(True)
            self.rasternameLineEdit.setEnabled(False)
            self.rasternameLabel.setEnabled(False)
            self.rasternameLineEdit.setText('%RASTERNAME%')
