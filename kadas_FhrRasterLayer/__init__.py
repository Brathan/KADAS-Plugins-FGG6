# -*- coding: utf-8 -*-


def classFactory(iface):
    from .kadas_FhrRasterLayer import KadasPlugin
    return KadasPlugin(iface)
