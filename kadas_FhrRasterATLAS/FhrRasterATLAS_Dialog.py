import os
from pathlib import Path
from datetime import datetime

from qgis.PyQt import uic
from qgis.PyQt import QtWidgets
from qgis.PyQt.QtGui import * 
import qgis

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
                       QgsExpressionContextUtils)

from qgis.gui import (QgsMapToolPan)


import processing
from processing.core.Processing import Processing


from .AtlasExporter import AtlasExporter
from .main.utilities import Styles, Color



# This loads your .ui file so that PyQt can populate your plugin with the elements from Qt Designer
"""Load UI"""
FORM_CLASS, _ = uic.loadUiType(os.path.join(
    os.path.dirname(__file__), 'atlas_dialog_base.ui'))


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
        self.Atlas_Exporter = AtlasExporter(dialog=self)
        
        # Init Components
        self.button_close.clicked.connect(self.reject)
        self.pb_create_layout.clicked.connect(self._export_ATLAS)
        self.cb_coverageLayer.currentIndexChanged.connect(self._coverageLayer_changed)
        # self.mQgsFileWidget.setFilePath(self._update_file_path())

        # self.extent_drawer = RectangleMapTool(self.canvas, self)
        # self.canvas.scaleChanged.connect(self._show_map_canvas_scale)
        # self.label_n_cells.setText('')
        
        # self.pb_create_layout.setEnabled(False)
        # self.label_pdf_created.setText('')
        # self.outputlayer = None
        # self.outputlayer_id = None
        
        # # self.button_close_help.helpRequested.connect(self._help_requested)
        # self.dpi = self.choose_dpi.value()
        # self.choose_dpi.valueChanged.connect(self._dpi_changed)
        # self.rejected.connect(self._remove_grid_layer_from_map)
        # self.set_karteninformationen()
        # self.toggle_bbox = False
        # self.pB_bbox.clicked.connect(self.activate_extent_drawer)
        # self.canvas.extentsChanged.connect(self.extent_drawer.update_nwse)
        # self.extent_drawer.update_nwse()
        # self.set_tooltips()


    def set_tooltips(self):
        # PushButtons
        self.pB_createGrid.setToolTip("Erstelle ein Gitter gemäss obigen Papiereinstellungen")
        self.pb_create_layout.setToolTip("Startet die PDF Erstellung")
        self.pB_bbox.setToolTip("Zeichne ein Rechteck für das zu erstellende Gitter")
        self.pB_deleteGrid.setToolTip("Löscht den Gitter Layer ")
        # Combo Boxes
        self.cb_map_scale.setToolTip("Wähle einen Massstab.\nDas hat einen Einfluss auf die Grösse der Gitterzellen")
        self.cb_paper_orientation.setToolTip("Wähle eine Papiergrösse und Orientierung.\nDas hat einen Einfluss auf die Grösse UND Ausrichtung der Gitterzellen")


    def reload(self):
        self._empty_labels()
        self.mQgsFileWidget.setFilePath(self._update_file_path())
        self.setGeometry(900,300,500,650)
        self.set_karteninformationen()

    def _print_info(self):
        print(self)

    def reject(self):
        print("Exit Pressed")
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
    
    def _validate_Layer(self,layer):
        # Validate layer
        if isinstance(layer, QgsRasterLayer):
            print(f"Coverage layer is a raster layer: {layer.name()}")
            # ToDo print to status box
            return 0
        elif isinstance(layer, QgsVectorLayer):
            print(f"Number of features in coverage layer: {layer.featureCount()}")
            return 1
        else:
            print("Unsupported layer type")
            return 0
    
    def _export_ATLAS(self):
        selectedLayer = self.cb_coverageLayer.currentLayer()
        if self._validate_Layer(selectedLayer):      
            outPath = self.mQgsFileWidget.filePath()
            print('exportCallback')
            print(selectedLayer)
            self.Atlas_Exporter.export(coverage_layer=selectedLayer,
                                    export_format='.pdf',
                                    output_directory=outPath)  
        
    def _coverageLayer_changed(self):
        # get selected layer and load style
        selectedLayer = self.cb_coverageLayer.currentLayer()
                
        # Path to the style defintion file
        style_file_path = os.path.join(self.plugin_dir, 'main', 'templates', 'FhrRaster_ATLAS_StyleDef.qml')
        
        # Check if the style file exists
        if os.path.exists(style_file_path):
            # Load the style from the QML file
            selectedLayer.loadNamedStyle(style_file_path)
            selectedLayer.triggerRepaint()  # Ensure the layer is repainted with the new style
            print(f"Style applied from {style_file_path}")
        else:
            print(f"Style file not found: {style_file_path}")