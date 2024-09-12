
import os
import shutil

from kadas_FhrRasterATLAS.atlas_exporter import AtlasExporter

from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtXml import QDomDocument

from kadas.kadascore import *
from kadas.kadasgui import *
from kadas.kadasanalysis import *

from qgis.core import QgsProject, QgsReadWriteContext, QgsPrintLayout

class KadasExample(QObject):

    def __init__(self, iface):
        QObject.__init__(self)

        print( '***************************Konstruktor kadas_FhrRasterATLAS**************************' )
        self.plugin_dir = os.path.dirname(__file__)
        self.iface = KadasPluginInterface.cast(iface)

    def initGui(self):
        self.exampleAction = QAction(QIcon(self.tr(self.plugin_dir) + "/icons/FührungsRaster_Icon.png"), self.tr("FhrRaster Atlas"))
        self.exampleAction.triggered.connect(self.__run)
        self.iface.addAction(self.exampleAction, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")


    def unload(self):
        self.iface.removeAction( self.exampleAction, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6" )

    def __run(self):
        # Custom parameters for initializing the AtlasExporter
        coverage_layer_name = 'RasterDefinition'  # Adjust this to your layer name
        export_format = '.pdf'  # You can switch to '.tiff' if needed
        output_directory = "C:/temp/Atlas_Exports"  # Your custom output directory
        template_path = self.tr(self.plugin_dir) +'/FhrRaster_ATLAS_Template.qpt'
        
        # Create an instance of AtlasExporter with custom parameters
        atlasExporter = AtlasExporter(
            coverage_layer_name=coverage_layer_name,
            export_format=export_format,
            output_directory=output_directory,
            template_path=template_path,
        )

        # Call the export method to export the Atlas pages
        atlasExporter.export()
