import os
from qgis.core import QgsProject, QgsPrintLayout, QgsLayoutExporter, QgsReadWriteContext
from PyQt5.QtXml import QDomDocument

class AtlasExporter:
    def __init__(self, coverage_layer_name='RasterDefinition', export_format='.tiff',
                 output_directory="/atlas_outputs", template_path='FhrRaster_ATLAS_Template.qpt'):
        self.coverage_layer_name = coverage_layer_name
        self.export_format = export_format
        self.output_directory = output_directory
        self.template_path = template_path
        self.layout_name = 'FhrRaster ATLAS'

        # Ensure the output directory exists, create it if necessary
        if not os.path.exists(self.output_directory):
            os.makedirs(self.output_directory)

        # Load the QGIS project.
        self.project = QgsProject.instance()

    def get_coverage_layer(self):
        # Attempt to get the coverage layer by name
        coverage_layer = self.project.mapLayersByName(self.coverage_layer_name)
        if not coverage_layer:
            print(f"Error: Layer '{self.coverage_layer_name}' not found!")
            return None
        return coverage_layer[0]

    def load_layout(self):
        # Access the layout manager
        layout_manager = self.project.layoutManager()

        # Check if the layout already exists
        for print_layout in layout_manager.printLayouts():
            if print_layout.name() == self.layout_name:
                return print_layout

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
        print('...done')
        return layout

    def export(self):
        coverage_layer = self.get_coverage_layer()
        if coverage_layer is None:
            return

        layout = self.load_layout()

        print(f"Number of features in coverage layer: {coverage_layer.featureCount()}")

        atlas = layout.atlas()
        atlas.setCoverageLayer(coverage_layer)
        atlas.setHideCoverage(True)
        atlas.setEnabled(True)

        map_item = layout.itemById('Karte 1')  # Adjust 'Karte 1' to your map item's ID
        if map_item:
            map_item.setAtlasDriven(True)

            # Start rendering the Atlas
            atlas.beginRender()
            atlas.first()

            exporter = QgsLayoutExporter(layout)

            # Iterate over all features in the coverage layer
            for feature in coverage_layer.getFeatures():
                raster_name = feature['RasterName']  # Retrieve the "RasterName" attribute
                file_name = os.path.join(self.output_directory, f'FhrRaster_{raster_name}{self.export_format}')

                if self.export_format == '.pdf':
                    export_settings = QgsLayoutExporter.PdfExportSettings()
                    result = exporter.exportToPdf(file_name, export_settings)
                elif self.export_format == '.tiff':
                    export_settings = QgsLayoutExporter.ImageExportSettings()
                    export_settings.dpi = 300
                    export_settings.imageFormat = 'tiff'
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

