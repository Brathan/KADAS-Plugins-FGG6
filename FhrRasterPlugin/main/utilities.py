import os
from qgis.PyQt.QtGui import (QColor,
                             QFont
                             )

from qgis.core import (QgsPalLayerSettings,
                       QgsTextFormat,
                       QgsTextBufferSettings,
                       QgsVectorLayerSimpleLabeling
    )



class Styles():
    def __init__(self, is_kadas=None, button=None):
        self.is_kadas = is_kadas
        self._get_stylesheet()
        self.button = button


    @property
    def OK(self):
        "The OK Property"
        return self.stylesheet['OK']


    @property
    def INFO(self):
        "The OK Property"
        return self.stylesheet['INFO']


    @property
    def WARN(self):
        "The OK Property"
        return self.stylesheet['WARN']


    def _get_stylesheet(self):
        if self.is_kadas:
            self.stylesheet = {
                'OK':   'color: green; font: 75 9pt "Consolas"',
                'INFO': 'color: orange; font: 80 9pt "Consolas"',
                'WARN': 'color: red; font: 75 9pt "Consolas"'
                }
        else:
            self.stylesheet = {
                'OK':   'color: green; font: 75 9pt "Consolas"; background-color: rgb(38,59,78)',
                'INFO': 'color: yellow; font: 75 9pt "Consolas"; background-color: rgb(38,59,78)',
                'WARN': 'color: red; font: 75 9pt "Consolas"; background-color: rgb(38,59,78)'
                }
    
    @staticmethod
    def style_button_clicked(button=None):
        if not button:
            return
        button.setFlat(True)
        button.setAutoFillBackground(True)
        button.setStyleSheet('background-color: rgb(200,200,200); color: rgb(0, 170,0)')
        return button

    @staticmethod
    def style_button_normal(button=None):
        if not button:
            return
        button.setFlat(False)
        button.setAutoFillBackground(False)
        button.setStyleSheet('')
        return button


    @staticmethod
    def grid_labeling(layer=None):
        if not layer:
            return
        layer_settings  = QgsPalLayerSettings()
        text_format = QgsTextFormat()
        text_format.setFont(QFont("Arial", 12))
        text_format.setSize(14)

        buffer_settings = QgsTextBufferSettings()
        buffer_settings.setEnabled(True)
        buffer_settings.setSize(1)
        buffer_settings.setColor(QColor("white"))

        text_format.setBuffer(buffer_settings)
        layer_settings.setFormat(text_format)

        layer_settings.fieldName = "id"
        # layer_settings.placement = 2
        layer_settings.enabled = True

        layer_settings = QgsVectorLayerSimpleLabeling(layer_settings)
        layer.setLabelsEnabled(True)
        layer.setLabeling(layer_settings)
        return layer



class Color():
    def __init__(self, is_kadas=None):
        self.is_kadas = is_kadas
        self.grid_color = self._get_colors()
        self.label_color = self._get_label_color()
        self.rb_color = self._get_rb_color()
        self.rbs_color = self._get_rbs_color()



    @property
    def GRID(self):
        """Color for the Grid """
        return self.grid_color

    @property
    def LABEL(self):
        """Color for Labels on the Grid"""
        return self.label_color

    @property
    def RB(self):
        """Color for Rubberband / Rectangle """
        return self.rb_color

    @property
    def RBS(self):
        """Color for Line/Stroke of Rubberband / Rectangle """
        return self.rbs_color

    def _get_colors(self):
        return QColor(153,51,255,alpha=120)

    def _get_label_color(self):
        return QColor(0,0,0,alpha=255)


    def _get_rb_color(self):
        return QColor(28,40,224,alpha=120)


    def _get_rbs_color(self):
        return QColor(28,40,224,alpha=120)



class Tooltips():
    def __init__(self):
        pass 



