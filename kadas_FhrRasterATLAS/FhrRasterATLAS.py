from qgis.PyQt.QtCore import QSettings, QTranslator, QCoreApplication
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QAction

# Initialize Qt resources from file resources.py
# from .resources import *

# Import the code for the dialog
from .FhrRasterATLAS_Dialog import FhrRasterATLAS_Dialog
from .AtlasExporter import AtlasExporter

import os.path
try:
    from kadas.kadasgui import KadasPluginInterface
except ImportError:
    pass



class FhrRasterATLAS:
    """QGIS Plugin and KADAS Plugin Implementation."""

    def __init__(self, iface):
        """Constructor.

        :param iface: An interface instance that will be passed to this class
            which provides the hook by which you can manipulate the QGIS
            application at run time.
        :type iface: QgsInterface
        """
        # Save reference to the QGIS interface
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
        # initialize locale
        locale = QSettings().value('locale/userLocale')[0:2]
        locale_path = os.path.join(
            self.plugin_dir,
            'i18n',
            'FhrRasterATLAS_{}.qm'.format(locale))

        if os.path.exists(locale_path):
            self.translator = QTranslator()
            self.translator.load(locale_path)
            QCoreApplication.installTranslator(self.translator)

        # Declare instance attributes
        self.actions = []
        self.menu = self.tr(u'&FhrRaster ATLAS for KADAS')

        # Check if plugin was started the first time in current QGIS session
        # Must be set in initGui() to survive plugin reloads
        self.first_start = None

        # Config
        if self.is_kadas:
            self._FhrRasterATLAS_Dialog = None
            self.iface.projectWillBeClosed.connect(self.close_FhrRasterATLAS_window)

    # noinspection PyMethodMayBeStatic
    def tr(self, message):
        """Get the translation for a string using Qt translation API.

        We implement this ourselves since we do not inherit QObject.

        :param message: String for translation.
        :type message: str, QString

        :returns: Translated version of message.
        :rtype: QString
        """
        # noinspection PyTypeChecker,PyArgumentList,PyCallByClass
        return QCoreApplication.translate('FhrRasterAtlas', message)

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

    def initGui(self):
        """Create the menu entries and toolbar icons inside the QGIS GUI."""
        # will be set False in run()
        self.first_start = True 
        if self.is_kadas:
            self.actionFhrRasterATLAS = QAction(QIcon(os.path.join(self.tr(self.plugin_dir), "icons","FhrRasterATLAS_icon.png")), "FhrRaster Atlas", self.iface.mainWindow(), toggled=self.run)
            self.actionFhrRasterATLAS.setCheckable(True)

            self.iface.addAction(self.actionFhrRasterATLAS, self.iface.PLUGIN_MENU,self.iface.CUSTOM_TAB, "&FGG6")
            self.iface.getRibbonWidget().currentChanged.connect(self.tab_changed)
        else:
            icon_path = os.path.join(self.tr(self.plugin_dir), "icons","FhrRasterATLAS_icon.png")
            self.add_action(
                icon_path,
                text=self.tr(u'Export multiple Fhr Raster'),
                callback=self.run,
                parent=self.iface.mainWindow())

    def tab_changed(self):
        if self._FhrRasterATLAS_Dialog:
            self.close_FhrRasterATLAS_window()
        self.iface.actionSaveProject()

    def unload(self):
        """Removes the plugin menu item and icon from QGIS GUI."""
        if self.is_kadas:
            self.iface.removeAction(self.actionFhrRasterATLAS, self.iface.PLUGIN_MENU, self.iface.CUSTOM_TAB, "&FGG6")
            self.iface.getRibbonWidget().currentChanged.connect(self.tab_changed)
        else:
            for action in self.actions:
                self.iface.removePluginMenu(
                    self.tr(u'&FhrRaster ATLAS for KADAS'),
                    action)
                self.iface.removeToolBarIcon(action)

    def run(self,toggle_state):
        """Run method that performs all the real work"""

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
            self._FhrRasterATLAS_Dialog.setWindowIcon(QIcon(os.path.join(self.tr(self.plugin_dir), "icons","FhrRasterATLAS_icon.png")))

        # self._FhrRasterATLAS_Dialog.reload()
        
        # show the dialog
        self._FhrRasterATLAS_Dialog.show()
        # Run the dialog event loop
        result = self._FhrRasterATLAS_Dialog.exec_()
        
        # See if OK was pressed  
        if result:
            # Do something useful here - delete the line containing pass and
            # substitute with your code.
            # grid = GridCreator(iface=self.iface)
            pass

    def close_FhrRasterATLAS_window(self):
        if self._FhrRasterATLAS_Dialog:
            self._FhrRasterATLAS_Dialog.reject()
            self.actionFhrRasterATLAS.setChecked(False)
