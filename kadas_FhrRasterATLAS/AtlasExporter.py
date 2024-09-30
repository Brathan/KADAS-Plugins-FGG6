import os
from pathlib import Path
from qgis.core import QgsProject, QgsPrintLayout, QgsLayoutExporter, QgsReadWriteContext, QgsLayoutRenderContext
from PyQt5.QtXml import QDomDocument
from qgis.PyQt.QtGui import QColor

class AtlasExporter:
    def __init__(self, dialog):      
        self.dialog = dialog
        self.project = self.dialog.iface 
        self.manager = QgsProject.instance().layoutManager()
        
        # initialize plugin directory
        self.plugin_dir = os.path.dirname(__file__)
        template_name = 'FhrRaster_ATLAS_Template.qpt'
        self.template_path = os.path.join(self.plugin_dir, 'main', 'templates',template_name)
        self.layout_name = 'FhrRaster ATLAS'

        # Load the QGIS project.
        self.project = QgsProject.instance()

    def _get_ATLAS_Layout(self):
        # Check if the layout already exists
        for print_layout in self.manager.printLayouts():
            if print_layout.name() == self.layout_name:
                self.ATLAS_layout = print_layout
                return 

        # Otherwise, load layout from template
        layout = QgsPrintLayout(self.project)
        layout.initializeDefaults()
        print('Load template from file...')
        with open(self.template_path) as f:
            template_content = f.read()
            doc = QDomDocument()
            doc.setContent(template_content)
            layout.loadFromTemplate(doc, QgsReadWriteContext(), True)
            layout.setName(self.layout_name)
            self.project.layoutManager().addLayout(layout)
        self.ATLAS_layout = layout
        print('...done')    
       

    def export(self, coverage_layer, export_format, output_directory):

        self._get_ATLAS_Layout()
        
        print(f"Number of features in coverage layer: {coverage_layer.featureCount()}")

        atlas = self.ATLAS_layout.atlas()
        atlas.setCoverageLayer(coverage_layer)
        atlas.setEnabled(True)
        atlas.setHideCoverage(True)

        map_item = self.ATLAS_layout.itemById('Karte 1')  # Adjust 'Karte 1' to your map item's ID
        if map_item:
            map_item.setAtlasDriven(True)

            # Start rendering the Atlas
            atlas.beginRender()
            atlas.first()
            atlas.setHideCoverage(True)
            
            exporter = QgsLayoutExporter(self.ATLAS_layout)

            # Iterate over all features in the coverage layer
            for feature in coverage_layer.getFeatures():
                raster_name = feature['RasterName']  # Retrieve the "RasterName" attribute
                file_name = os.path.join(output_directory, f'FhrRaster_{raster_name}{export_format}')

                if export_format == '.pdf':
                    export_settings = QgsLayoutExporter.PdfExportSettings()
                    # hide Coverage
                    export_settings.flags = QgsLayoutRenderContext.Flag(QgsLayoutRenderContext.FlagHideCoverageLayer |                              
                                            QgsLayoutRenderContext.FlagAntialiasing |
                                            QgsLayoutRenderContext.FlagUseAdvancedEffects)
                    
                    result = exporter.exportToPdf(file_name, export_settings)
                elif export_format == '.tiff':
                    export_settings = QgsLayoutExporter.ImageExportSettings()
                    # hide Coverage
                    export_settings.flags = QgsLayoutRenderContext.Flag(QgsLayoutRenderContext.FlagHideCoverageLayer |                              
                                            QgsLayoutRenderContext.FlagAntialiasing |
                                            QgsLayoutRenderContext.FlagUseAdvancedEffects)
                    # image settings
                    export_settings.dpi = 300
                    export_settings.imageFormat = 'tiff'
                    export_settings.backgroundColor = QColor(0, 0, 0, 0)  # RGBA where A = 0 means fully transparent
                    export_settings.writeWorldFile = True
                    result = exporter.exportToImage(file_name, export_settings)
                else:
                    print('Unsupported file format')
                    return

                if result == QgsLayoutExporter.Success:
                    print(f"Page exported successfully: {raster_name}")
                else:
                    print(f"Failed to export page: {raster_name}")

                atlas.next()

            # Finish rendering the Atlas
            atlas.endRender()
            print("Done!")
        else:
            print("Map item not found in the layout!")

# ToDo
# - Check for unsupported file names
#
# 
# 
# 
# 
# 