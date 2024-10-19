# -*- coding: utf-8 -*-


def classFactory(iface):
    from .FhrRasterPlugin import FhrRasterPlugin
    return FhrRasterPlugin(iface)
