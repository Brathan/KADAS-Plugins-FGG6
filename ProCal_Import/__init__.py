# -*- coding: utf-8 -*-


def classFactory(iface):
    from .kadas_ProCal_Import import KadasExample
    return KadasExample(iface)
