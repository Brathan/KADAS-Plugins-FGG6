# -*- coding: utf-8 -*-


def classFactory(iface):
    from .kadas_Rasterkarte import KadasExample
    return KadasExample(iface)
