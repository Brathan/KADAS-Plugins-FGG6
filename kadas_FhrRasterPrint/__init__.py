# -*- coding: utf-8 -*-


def classFactory(iface):
    from .kadas_FhrRasterPrint import KadasExample
    return KadasExample(iface)
