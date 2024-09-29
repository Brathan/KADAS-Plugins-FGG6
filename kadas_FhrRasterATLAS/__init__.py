# -*- coding: utf-8 -*-


def classFactory(iface):
    from .FhrRasterATLAS import FhrRasterATLAS
    return FhrRasterATLAS(iface)
