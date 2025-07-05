import os.path
import shutil

from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtXml import QDomDocument
from qgis.core import QgsProject, QgsVectorLayer, QgsReadWriteContext, QgsPrintLayout
from qgis.PyQt.QtCore import QSettings, QTranslator, QCoreApplication
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QAction

# Import the code for the dialog
from .FhrRasterATLAS_Dialog import FhrRasterATLAS_Dialog

# Import the custom attribute editor
from .main.AttributeEditor import init_attribute_editor_tool


# from kadas.kadascore import *
# from kadas.kadasgui import *
# from kadas.kadasanalysis import *

class FhrRasterPlugin:
    """QGIS Plugin and KADAS Plugin Implementation."""
    
    def __init__(self, iface):
        print('***************************Konstruktor FhrRasterPlugin**************************')
        # Make Plugin work in QGIS AND KADAS
        try:
            from kadas.kadasgui import KadasPluginInterface
            self.iface = KadasPluginInterface.cast(iface)
            self.is_kadas = True
        except ImportError:
            self.iface = iface
            self.is_kadas = False
        
        # initialize plugin directory
        self.plugin_dir = os.path.dirname(__file__)
        
        # Initialize locale
        locale = QSettings().value('locale/userLocale')[0:2]
        locale_path = os.path.join(self.plugin_dir, 'i18n', 'FhrRasterPlugin_{}.qm'.format(locale))
        
        if os.path.exists(locale_path):
            self.translator = QTranslator()
            self.translator.load(locale_path)
            QCoreApplication.installTranslator(self.translator)

        # Declare instance attributes
        self.actions = []
        self.menu = self.tr(u'&FhrRaster Schweiz Plugin')
        
        # Check if plugin was started the first time in current QGIS session
        # Must be set in initGui() to survive plugin reloads
        self.first_start = None
        
        # Config
        if self.is_kadas:
            self._FhrRasterATLAS_Dialog = None
            self.iface.projectWillBeClosed.connect(self.close_FhrRasterATLAS_window)

    def initGui(self):
        """Create the menu entries and toolbar icons inside the QGIS GUI."""
        # will be set False in run()
        self.first_start = True 
        if self.is_kadas:
            # Adding actions for all three functionalities
            print('*** Adding FhrRaster Layout')
            self.actionFhrRasterPrint = QAction(QIcon(os.path.join(self.tr(self.plugin_dir), 'icons','FhrRasterLayout_icon.png')), self.tr("FhrRaster Layout"))
            self.actionFhrRasterPrint.triggered.connect(self.__run_print)
            self.iface.addAction(self.actionFhrRasterPrint, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")
                        
            print('*** Adding FhrRaster Atlas')
            self.actionFhrRasterATLAS = QAction(QIcon(os.path.join(self.tr(self.plugin_dir), 'icons','FhrRasterATLAS_icon.png')), "FhrRaster Atlas", self.iface.mainWindow(), toggled=self.run_atlas)
            self.actionFhrRasterATLAS.setCheckable(True)
            self.iface.addAction(self.actionFhrRasterATLAS, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")

            print('*** Adding Attribute Editor Tool')
            self.actionAttributeEditor = QAction(QIcon(os.path.join(self.tr(self.plugin_dir), 'icons', 'AttributeEditor_icon.svg')),self.tr("Edit Atlas"))
            self.actionAttributeEditor.triggered.connect(self.__run_attribute_editor)
            self.iface.addAction(self.actionAttributeEditor, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")

            print('*** Adding FhrRaster Layer')
            self.actionFhrRasterLayer = QAction(QIcon(os.path.join(self.tr(self.plugin_dir), 'icons','FhrRasterLayer_icon.png')), self.tr("FhrRaster Layer"))
            self.actionFhrRasterLayer.triggered.connect(self.__run_layer)
            self.iface.addAction(self.actionFhrRasterLayer, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")

        else:
            #TODO add other actions
            icon_path = os.path.join(self.tr(self.plugin_dir), 'icons','FhrRasterATLAS_icon.png')
            self.add_action(
                icon_path,
                text=self.tr(u'Export multiple Fhr Raster'),
                callback=self.run_atlas,
                parent=self.iface.mainWindow())
        
                # copy custom functions
        expressionsFolder = os.path.join(os.path.dirname(os.path.dirname(self.tr(self.plugin_dir))),'expressions')
        print(expressionsFolder)
        # Copy getGrid.py
        sourceFile = os.path.join(self.tr(self.plugin_dir),'main','getGrid.py')
        destination_path = os.path.join(expressionsFolder,'getGrid.py')
        shutil.copy(sourceFile, destination_path)

        # Copy gridDefinitions.py
        sourceFile = os.path.join(self.tr(self.plugin_dir),'main','gridDefinitions.py')
        destination_path = os.path.join(expressionsFolder,'gridDefinitions.py')
        shutil.copy(sourceFile, destination_path)
            
    def unload(self):
        # Remove all actions
        if self.is_kadas:
            self.iface.removeAction(self.actionFhrRasterLayer,  self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")
            self.iface.removeAction(self.actionFhrRasterPrint,  self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")
            self.iface.removeAction(self.actionFhrRasterATLAS,  self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")
            self.iface.removeAction(self.actionAttributeEditor, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")
        else:
            for action in self.actions:
                self.iface.removePluginMenu(
                    self.tr(u'&FhrRaster ATLAS for KADAS'),
                    action)
                self.iface.removeToolBarIcon(action)
                                             
    def __run_layer(self):
        shapefile_path = os.path.join(self.tr(self.plugin_dir),'main','shapeLayer','FührungsRasterSchweiz.shp')
        print(shapefile_path)
        vector_layer = QgsVectorLayer(shapefile_path, "FührungsRasterSchweiz", "ogr")
        if not vector_layer.isValid():
            print("Layer failed to load!")
        QgsProject.instance().addMapLayer(vector_layer)
        self.iface.mapCanvas().refresh()

    def __run_print(self):
        template_path = os.path.join(self.tr(self.plugin_dir),'main','templates','FhrRaster_Single_Template.qpt')
        layout_name = 'FührungsRaster Vorlage'
        project = QgsProject.instance()
        layout = QgsPrintLayout(project)
        layout_manager = project.layoutManager()
        notLoaded = True
        for print_layout in layout_manager.printLayouts():
            if print_layout.name() == layout_name:
                layout = print_layout
                notLoaded = False
        if notLoaded:
            layout.initializeDefaults()
            with open(template_path) as f:
                template_content = f.read()
                doc = QDomDocument()
                doc.setContent(template_content)
                items, ok = layout.loadFromTemplate(doc, QgsReadWriteContext(), True)
                layout.setName(layout_name)
                project.layoutManager().addLayout(layout)
        self.iface.showLayoutDesigner(layout)
    
    def __run_attribute_editor(self):
        from .main.AttributeEditor import show_attribute_editor_tool
        show_attribute_editor_tool(self.iface)


    def run_atlas(self, toggle_state):
        if self.is_kadas:
            if toggle_state:
                self.show_FhrRasterATLAS_window()
            else:
                self.close_FhrRasterATLAS_window()
        else:
            self.show_FhrRasterATLAS_window()

    def show_FhrRasterATLAS_window(self):
        # Create the dialog with elements (after translation) and keep reference
        # Only create GUI ONCE in callback, so that it will only load when the plugin is started
        if self.first_start:
            self.first_start = False
            if self.is_kadas:
                self._FhrRasterATLAS_Dialog = FhrRasterATLAS_Dialog(self, self.iface.mainWindow(),self.actionFhrRasterATLAS.setChecked,
                                                            iface=self.iface)
            else:
                self._FhrRasterATLAS_Dialog = FhrRasterATLAS_Dialog(self, self.iface.mainWindow(),iface=self.iface)
            self._FhrRasterATLAS_Dialog.setWindowIcon(QIcon(os.path.join(self.tr(self.plugin_dir), 'icons','FhrRasterATLAS_icon.png')))   
        # show the dialog
        self._FhrRasterATLAS_Dialog.show()
        # Run the dialog event loop
        result = self._FhrRasterATLAS_Dialog.exec_()

    def close_FhrRasterATLAS_window(self):
        if self._FhrRasterATLAS_Dialog:
            self._FhrRasterATLAS_Dialog.reject()
            self.actionFhrRasterATLAS.setChecked(False)

    def tr(self, message):
        return QCoreApplication.translate('FhrRasterPlugin', message)


    def add_action(
        self,
        icon_path,
        text,
        callback,
        enabled_flag=True,
        add_to_menu=True,
        add_to_toolbar=True,
        status_tip=None,
        whats_this=None,
        parent=None):
        """Add a toolbar icon to the toolbar.

        :param icon_path: Path to the icon for this action. Can be a resource
            path (e.g. ':/plugins/foo/bar.png') or a normal file system path.
        :type icon_path: str

        :param text: Text that should be shown in menu items for this action.
        :type text: str

        :param callback: Function to be called when the action is triggered.
        :type callback: function

        :param enabled_flag: A flag indicating if the action should be enabled
            by default. Defaults to True.
        :type enabled_flag: bool

        :param add_to_menu: Flag indicating whether the action should also
            be added to the menu. Defaults to True.
        :type add_to_menu: bool

        :param add_to_toolbar: Flag indicating whether the action should also
            be added to the toolbar. Defaults to True.
        :type add_to_toolbar: bool

        :param status_tip: Optional text to show in a popup when mouse pointer
            hovers over the action.
        :type status_tip: str

        :param parent: Parent widget for the new action. Defaults None.
        :type parent: QWidget

        :param whats_this: Optional text to show in the status bar when the
            mouse pointer hovers over the action.

        :returns: The action that was created. Note that the action is also
            added to self.actions list.
        :rtype: QAction
        """

        icon = QIcon(icon_path)
        action = QAction(icon, text, parent)
        action.triggered.connect(callback)
        action.setEnabled(enabled_flag)

        if status_tip is not None:
            action.setStatusTip(status_tip)

        if whats_this is not None:
            action.setWhatsThis(whats_this)

        if add_to_toolbar:
            # Adds plugin icon to Plugins toolbar
            self.iface.addToolBarIcon(action)

        if add_to_menu:
            self.iface.addPluginToMenu(
                self.menu,
                action)

        self.actions.append(action)

        return action