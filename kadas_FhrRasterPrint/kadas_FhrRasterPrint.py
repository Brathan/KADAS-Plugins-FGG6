
import os
import shutil

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

        print( '***************************Konstruktor kadas_FhrRasterPrint**************************' )
        self.plugin_dir = os.path.dirname(__file__)
        self.iface = KadasPluginInterface.cast(iface)

    def initGui(self):
        self.exampleAction = QAction(QIcon(self.tr(self.plugin_dir) + "/icons/FührungsRaster_Icon.png"), self.tr("Führungs Raster"))
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
        # Open the file dialog to select a TIF image
        projectPath = QgsProject.instance().absolutePath() + '/'

        # Set path
        template_path = self.tr(self.plugin_dir) +'/FührungsRaster_Vorlage.qpt'
        layout_name = 'FührungsRaster'

        # Load the QGIS project.
        project = QgsProject.instance()

        # Create a new QgsPrintLayout
        layout = QgsPrintLayout(project)

        # Access the layout manager
        layout_manager = project.layoutManager()

        # Loop through all layout names
        notLoaded = True
        for print_layout in layout_manager.printLayouts():
             if print_layout.name() == layout_name:
                layout = print_layout
                notLoaded = False

        if notLoaded:
            layout.initializeDefaults()
            print( 'Load template form file... ' )
            with open(template_path) as f:
                template_content = f.read()
                doc = QDomDocument()
                doc.setContent(template_content)
                items, ok = layout.loadFromTemplate(doc, QgsReadWriteContext(), True)
                layout.setName(layout_name)
                project.layoutManager().addLayout(layout)
            print( '...done')

        # Open the layout in the layout designer.
        self.iface.showLayoutDesigner(layout)
