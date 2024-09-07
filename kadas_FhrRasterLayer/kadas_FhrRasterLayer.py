
import os
import shutil

from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtXml import QDomDocument

from kadas.kadascore import *
from kadas.kadasgui import *
from kadas.kadasanalysis import *

from qgis.core import QgsProject, QgsVectorLayer
from kadas_gpkg.kadas_gpkg_import import KadasGpkgImport

class KadasPlugin(QObject):

    def __init__(self, iface):
        QObject.__init__(self)

        print( '***************************Konstruktor kadas_FhrRasterLayer**************************' )
        self.plugin_dir = os.path.dirname(__file__)
        self.iface = KadasPluginInterface.cast(iface)

    def initGui(self):
        self.exampleAction = QAction(QIcon(self.tr(self.plugin_dir) + "/icons/FührungsRasterSchweiz_Icon.png"), self.tr("Add FhrRaster"))
        self.exampleAction.triggered.connect(self.__run)
        self.iface.addAction(self.exampleAction, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")

        # copy custom functions
        expressionsFolder = os.path.dirname(os.path.dirname(self.tr(self.plugin_dir))) + "/expressions"
    
        # Copy getGrid.py
        sourceFile = self.tr(self.plugin_dir) + "/getGrid.py"
        destination_path = expressionsFolder + "/getGrid.py"
        shutil.copy(sourceFile, destination_path)

        # Copy gridDefinitions.py
        sourceFile = self.tr(self.plugin_dir) + "/gridDefinitions.py"
        destination_path = expressionsFolder + "/gridDefinitions.py"
        shutil.copy(sourceFile, destination_path)


    def unload(self):
        self.iface.removeAction( self.exampleAction, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6" )

    def __run(self):
        shapefile_path = self.tr(self.plugin_dir) +'/FührungsRasterSchweiz.shp'

        # Create a vector layer
        vector_layer = QgsVectorLayer(shapefile_path, "FührungsRasterSchweiz", "ogr")

        # Check if the layer was loaded successfully
        if not vector_layer.isValid():
            print("Layer failed to load!")

        # Add the layer to the map
        QgsProject.instance().addMapLayer(vector_layer)

        # Refresh the map canvas (optional)
        self.iface.mapCanvas().refresh()
