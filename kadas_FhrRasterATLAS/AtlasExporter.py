import os
from pathlib import Path
from qgis.core import QgsProject, QgsPrintLayout, QgsLayoutExporter, QgsReadWriteContext, QgsLayoutRenderContext
from PyQt5.QtXml import QDomDocument
from qgis.PyQt.QtGui import QColor

class AtlasExporter:
    def __init__(self, dialog,progressBar=None):      
        self.dialog = dialog
        self.project = self.dialog.iface 
        self.manager = QgsProject.instance().layoutManager()
        self.progressBar = progressBar  # Add a reference to the progress bar
        
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
       

    def export(self, coverage_layer, export_format,one_file, output_directory,filename=None,prefix=None,suffix=None):
        self._get_ATLAS_Layout()

        feature_count = coverage_layer.featureCount()
        if feature_count == 0:
            print("No features to export.")
            return
        # If one_file is True, set feature count to 0 for progressbar 
        if one_file:
            feature_count = 0
            
        # Initialize progress bar if available
        if self.progressBar:
            self.progressBar.setVisible(True)
            self.progressBar.setMinimum(0)
            self.progressBar.setMaximum(feature_count)
            self.progressBar.setValue(0)
                    
        atlas = self.ATLAS_layout.atlas()
        atlas.setCoverageLayer(coverage_layer)
        atlas.setEnabled(True)
        atlas.setHideCoverage(True)
    
        map_item = self.ATLAS_layout.itemById('Karte 1')  # Adjust 'Karte 1' to your map item's ID
        if map_item:
            map_item.setAtlasDriven(True)

            # # Start rendering the Atlas
            atlas.beginRender()
            atlas.setHideCoverage(True)
            
            exporter = QgsLayoutExporter(self.ATLAS_layout)

            # If one_file is True, export all atlas pages to a single PDF
            if one_file:
                full_file_name = os.path.join(output_directory,filename + '.pdf')
                pdf_export_settings = QgsLayoutExporter.PdfExportSettings()
                
                # hide Coverage
                pdf_export_settings.flags = QgsLayoutRenderContext.Flag(QgsLayoutRenderContext.FlagHideCoverageLayer |                              
                                        QgsLayoutRenderContext.FlagAntialiasing |
                                        QgsLayoutRenderContext.FlagUseAdvancedEffects)
                
                # Export the atlas to a single PDF file
                print(f"Exporting to: {full_file_name}")
                result = exporter.exportToPdf(self.ATLAS_layout.atlas(), full_file_name, pdf_export_settings)

                # Unpack the tuple result
                result_code, result_message = result

                # Check the result code
                if result_code == 0:
                    print("Export successful!")
                elif result_code == 1:
                    print("Export canceled by the user.")
                elif result_code == 4:
                    print("File error occurred during export.")
                else:
                    print(f"Unknown result code: {result_code}, Message: {result_message}")
                
                self.progressBar.setMaximum(100)
                self.progressBar.setValue(100)
                
            else:                      
                # set first feature
                atlas.first()
                                
                # Iterate over all features in the coverage layer
                for i, feature in enumerate(coverage_layer.getFeatures()):
                    raster_name = feature['RasterName']  # Retrieve the "RasterName" attribute
                    
                    # Apply prefix and suffix to the file name
                    file_name = f"{prefix}{raster_name}{suffix}{export_format}"
                    full_file_name = os.path.join(output_directory, file_name)

                    if export_format == '.pdf':
                        pdf_export_settings = QgsLayoutExporter.PdfExportSettings()
                        # hide Coverage
                        pdf_export_settings.flags = QgsLayoutRenderContext.Flag(QgsLayoutRenderContext.FlagHideCoverageLayer |                              
                                                QgsLayoutRenderContext.FlagAntialiasing |
                                                QgsLayoutRenderContext.FlagUseAdvancedEffects)
                        
                        result = exporter.exportToPdf(full_file_name, pdf_export_settings)
                        
                    elif export_format == '.tiff':
                        image_export_settings = QgsLayoutExporter.ImageExportSettings()
                        # hide Coverage
                        image_export_settings.flags = QgsLayoutRenderContext.Flag(QgsLayoutRenderContext.FlagHideCoverageLayer |                              
                                                QgsLayoutRenderContext.FlagAntialiasing |
                                                QgsLayoutRenderContext.FlagUseAdvancedEffects)
                        # image settings
                        image_export_settings.dpi = 300
                        image_export_settings.imageFormat = 'tiff'
                        image_export_settings.backgroundColor = QColor(0, 0, 0, 0)  # RGBA where A = 0 means fully transparent
                        image_export_settings.writeWorldFile = True
                        # export
                        result = exporter.exportToImage(full_file_name, image_export_settings)
                    else:
                        print('Unsupported file format')
                        return

                    # Update progress bar
                    if self.progressBar:
                        self.progressBar.setValue(i + 1)

                    # Check if export was successful
                    print(result)
                    if result == QgsLayoutExporter.Success:
                        print(f"Page exported successfully: {full_file_name}")
                    else:
                        print(f"Failed to export page: {raster_name}")

                    # set next feature
                    atlas.next()

            # Finish rendering the Atlas
            atlas.endRender()
            print("Export completed!")
        else:
            print("Map item not found in the layout!")
