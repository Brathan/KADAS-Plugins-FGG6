from qgis.PyQt.QtWidgets import (
    QDialog, QVBoxLayout, QHBoxLayout, QTableWidget, QTableWidgetItem,
    QPushButton, QComboBox, QDockWidget, QWidget, QLabel
)
from qgis.PyQt.QtCore import Qt
from PyQt5.QtCore import QVariant
from qgis.core import QgsProject, QgsFeature, QgsPointXY, QgsGeometry
from qgis.gui import QgsMapCanvas

class AttributeTableWidget(QWidget):
    def __init__(self, layer, canvas):
        super().__init__()
        self.layer = layer
        self.canvas = canvas
        self._active_point_tool = None
        self._suppress_cell_signal = False

        self.field_rules = {
            "PageOrientation": ["Portrait", "Landscape"],
            "PageSize": ["A3", "A4"],
            "Scale": [25000, 10000, 5000, 3000,2500,1000],
        }
        self.default_values = {
            "PageOrientation": "Portrait",
            "PageSize": "A4",
            "Scale": 10000,
            "RasterName": "NewRaster"
        }

        # Initialize fields with the initial layer
        self.fields = self.layer.fields()
        main_layout = QVBoxLayout()

        # Dropdown to select point layer
        self.layer_selector = QComboBox()
        # Filter for vector layers that are points (geometryType() == 0)
        self.layer_selector.addItems([
            lyr.name() for lyr in QgsProject.instance().mapLayers().values()
            if lyr.type() == lyr.VectorLayer and lyr.geometryType() == 0
        ])
        # Connect the signal to the slot
        self.layer_selector.currentTextChanged.connect(self.change_layer)
        main_layout.addWidget(self.layer_selector)

        top_controls = QHBoxLayout()

        add_button = QPushButton("Add Row")
        add_button.clicked.connect(self.add_row)
        top_controls.addWidget(add_button)

        delete_button = QPushButton("Delete Row")
        delete_button.clicked.connect(self.delete_row)
        top_controls.addWidget(delete_button)

        main_layout.addLayout(top_controls)

        self.table = QTableWidget()
        self.table.setSelectionBehavior(QTableWidget.SelectRows)
        main_layout.addWidget(self.table)

        self.status_label = QLabel("")
        self.status_label.setStyleSheet("color: orange; font-weight: bold; padding: 4px;")
        main_layout.addWidget(self.status_label)

        self.setLayout(main_layout)

        # Call change_layer initially to set up the table for the first selected layer
        # This ensures the table is populated correctly on startup
        initial_layer_name = self.layer_selector.currentText()
        if initial_layer_name: # Ensure there's a selected layer
            self.change_layer(initial_layer_name)
        else:
            # If no point layers exist, clear the table and show a message
            self.table.setRowCount(0)
            self.table.setColumnCount(0)
            self.status_label.setText("No point layers available in the project.")
        
    def change_layer(self, name):
        # Find the layer by name, ensuring it's a vector point layer
        layer_list = [lyr for lyr in QgsProject.instance().mapLayersByName(name)
                      if lyr.type() == lyr.VectorLayer and lyr.geometryType() == 0]
        if layer_list:
            # Set the new active layer
            self.layer = layer_list[0]
            print(f"Active layer changed to: {self.layer.name()}")
            # Update the fields list to reflect the new layer's fields
            self.fields = self.layer.fields()
            # Reload features to update the table content
            self.load_features()
            
        else:
            # Handle case where selected layer is not found or not a point layer
            print(f"Could not find a point layer named: {name}")
            self.table.setRowCount(0) # Clear the table if no valid layer is found
            self.table.setColumnCount(0)
            self.status_label.setText(f"No valid point layer found for '{name}'.")

    def load_features(self):
        print(f"Loading features for {self.layer.name()}")
        # Suppress cellChanged signal to prevent unintended updates during table population
        self._suppress_cell_signal = True

        # Clear existing rows and columns to ensure a clean refresh
        self.table.setRowCount(0)
        self.table.setColumnCount(0)
        self.table.clearContents() # Clear any remaining items
        features = list(self.layer.getFeatures())
        self.feature_ids = [f.id() for f in features]
        self.feature_geoms = {f.id(): f.geometry() for f in features}

        # Set new row and column counts
        self.table.setRowCount(len(features))
        # Add 3 extra columns for "Position", "Set" button, and "Show" button
        self.table.setColumnCount(len(self.fields) + 3)

        # Define table headers
        headers = [f.name() for f in self.fields] + ["Position", "Set", "Show"]
        self.table.setHorizontalHeaderLabels(headers)

        # Resize modes by header name
        from PyQt5.QtWidgets import QHeaderView
        for i, name in enumerate(headers):
            if name == "RasterName":
                self.table.horizontalHeader().setSectionResizeMode(i, QHeaderView.Stretch)
            elif name == "Position":
                self.table.horizontalHeader().setSectionResizeMode(i, QHeaderView.ResizeToContents)
            else:
                self.table.horizontalHeader().setSectionResizeMode(i, QHeaderView.ResizeToContents)

        for row, feat in enumerate(features):
            for col, field in enumerate(self.fields):
                name = field.name()
                value = feat.attribute(name)
                if name in self.field_rules:
                    widget = QComboBox()
                    widget.addItems([str(v) for v in self.field_rules[name]])
                    widget.setCurrentText(str(value))
                    widget.currentTextChanged.connect(lambda v, r=row, c=col: self.update_attribute(r, c, v))
                    self.table.setCellWidget(row, col, widget)
                else:
                    item = QTableWidgetItem(str(value))
                    self.table.setItem(row, col, item)
                    item.setFlags(item.flags() | Qt.ItemIsEditable)

            geom = feat.geometry()
            if geom and geom.asPoint():
                pt = geom.asPoint()
                position_str = f"{int(pt.y())} / {int(pt.x())}"
            else:
                position_str = "- / -"

            pos_item = QTableWidgetItem(position_str)
            pos_item.setFlags(Qt.ItemIsSelectable | Qt.ItemIsEnabled)
            self.table.setItem(row, len(self.fields), pos_item)

            btn_set = QPushButton("Set")
            btn_set.setToolTip("Set Position")
            btn_set.clicked.connect(lambda _, fid=feat.id(): self.prompt_new_position(fid))
            self.table.setCellWidget(row, len(self.fields) + 1, btn_set)

            btn_show = QPushButton("Show")
            btn_show.setToolTip("Jump to Feature")
            btn_show.clicked.connect(lambda _, fid=feat.id(): self.jump_to_feature(fid))
            self.table.setCellWidget(row, len(self.fields) + 2, btn_show)

        try:
            self.table.cellChanged.disconnect(self.update_cell_edit)
        except TypeError:
            pass
        self.table.cellChanged.connect(self.update_cell_edit)
        self._suppress_cell_signal = False

    def update_cell_edit(self, row, col):
        if self._suppress_cell_signal:
            return
        if col >= len(self.fields):
            return
        field = self.fields[col]
        value = self.table.item(row, col).text()
        fid = self.feature_ids[row]
        if not self.layer.isEditable():
            self.layer.startEditing()
        field_type = field.type()
        if field_type == QVariant.Int:
            value = int(value)
        elif field_type == QVariant.Double:
            value = float(value)
        self.layer.changeAttributeValue(fid, col, value)
        self.layer.commitChanges()
        self.layer.triggerRepaint()
        print(f"Updated attribute '{field.name()}' for feature {fid}")

    def update_attribute(self, row, col, value):
        field = self.fields[col]
        fid = self.feature_ids[row]
        if not self.layer.isEditable():
            self.layer.startEditing()
        field_type = field.type()
        if field_type == QVariant.Int:
            value = int(value)
        elif field_type == QVariant.Double:
            value = float(value)
        self.layer.changeAttributeValue(fid, col, value)
        self.layer.commitChanges()
        self.layer.triggerRepaint()
        print(f"Updated attribute '{field.name()}' for feature {fid}")

    def prompt_new_position(self, fid):
        from qgis.gui import QgsMapToolEmitPoint
        from qgis.utils import iface

        print(f"[DEBUG] Preparing to set new position for feature ID: {fid}")
        self.status_label.setText("Click on map to set new position...")

        class PointTool(QgsMapToolEmitPoint):
            def __init__(self, canvas, on_point_selected):
                super().__init__(canvas)
                self.canvas = canvas
                self.on_point_selected = on_point_selected

            def canvasReleaseEvent(self, event):
                point = self.toMapCoordinates(event.pos())
                print(f"[DEBUG] New position picked: {point.x()}, {point.y()}")
                self.on_point_selected(point)
                self.canvas.unsetMapTool(self)

        def set_position(point):
            print(f"[DEBUG] Applying new position to feature ID: {fid}")
            if not self.layer.isEditable():
                self.layer.startEditing()
            geom = QgsGeometry.fromPointXY(QgsPointXY(point))
            success = self.layer.changeGeometry(fid, geom)
            if success:
                print(f"[DEBUG] Geometry updated for feature {fid}")
            else:
                print(f"[ERROR] Failed to update geometry for feature {fid}")
            self.layer.commitChanges()
            self.load_features()
            self.layer.triggerRepaint()
            self.status_label.setText("")

        self._active_point_tool = PointTool(self.canvas, set_position)
        iface.mapCanvas().setMapTool(self._active_point_tool)
        print("[DEBUG] Click on the map to set new position.")

    def jump_to_feature(self, fid):
        geom = self.feature_geoms.get(fid)
        if not geom:
            return
        # Read scale field from feature
        feature = self.layer.getFeature(fid)
        scale = feature.attribute("Scale")
        if scale:
            self.canvas.zoomScale(float(scale))
        self.canvas.setExtent(geom.boundingBox())
        self.canvas.refresh()

    def add_row(self):
        if not self.layer.isEditable():
            self.layer.startEditing()
        feat = QgsFeature(self.fields)
        for field in self.fields:
            name = field.name()
            feat.setAttribute(name, self.default_values.get(name, None))
        self.layer.addFeature(feat)
        self.layer.commitChanges()
        self.load_features()
        print("New row added.")

    def delete_row(self):
        selected = self.table.selectedRanges()
        if not selected:
            return
        row = selected[0].topRow()
        fid = self.feature_ids[row]
        if not self.layer.isEditable():
            self.layer.startEditing()
        self.layer.deleteFeature(fid)
        self.layer.commitChanges()
        self.load_features()
        print(f"Deleted row {row} (feature ID: {fid})")

# Register tool for plugin toolbar
from qgis.PyQt.QtWidgets import QAction
from qgis.PyQt.QtGui import QIcon

def show_attribute_editor_tool(iface):
    canvas = iface.mapCanvas()
    layers = [lyr for lyr in QgsProject.instance().mapLayers().values()
              if lyr.type() == lyr.VectorLayer and lyr.geometryType() == 0]
    if not layers:
        print("No point layers available.")
        return
    dock = QDockWidget("Raster Attribute Editor", iface.mainWindow())
    widget = AttributeTableWidget(layers[0], canvas)
    dock.setWidget(widget)
    dock.setAllowedAreas(Qt.LeftDockWidgetArea | Qt.RightDockWidgetArea)
    iface.mainWindow().addDockWidget(Qt.RightDockWidgetArea, dock)

def init_attribute_editor_tool(plugin):
    action = QAction(QIcon(), "Open Attribute Editor", plugin.iface.mainWindow())
    action.triggered.connect(lambda: show_attribute_editor_tool(plugin.iface))
    plugin.iface.addAction(action, plugin.iface.PLUGIN_MENU, plugin.iface.CUSTOM_TAB, "&FGG6")
    plugin.attribute_editor_action = action
