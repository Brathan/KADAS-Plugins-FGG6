from qgis.core import *
from qgis.gui import *
import numpy as np

# Import hardcoded grids from the separate file
from kadas_FhrRasterPrint.gridDefinitions import grid25km, grid1km, grid250m, grid100m, grid50m

def get25km(gridNumber,xy):
     # Method for 25km grid
    if xy == 'x':    
        # Perform calculations for x
        input_25km = int(str(gridNumber)[:-3])*1000
        result_25km = grid25km[int(np.floor(input_25km / 25000))*25000]
        return str(result_25km)
    else:
        # Perform calculations for y
        return str(gridNumber)[-6:-4]
                
def get1km(gridNumber,xy):
    # Method for 1000m grid
    if xy == 'x': 
        # Perform calculations for x
        rest_25km = np.remainder(gridNumber, 25000)
        result_1km = grid1km[int(np.floor(rest_25km / 1000))*1000]
        return str(result_1km)        
    else:
        # Perform calculations for y      
        return str(gridNumber)[-6:-3]
    
def get250m(gridNumber,xy):
    # Method for 250m grid
    if xy == 'x': 
        # Perform calculations for x
        rest_250m = np.remainder(gridNumber, 1000)
        result_250m = grid250m[int(np.floor(rest_250m / 250))*250]
        return str(result_250m)
    else:
        # Perform calculations for y
        quot250m= int(str(gridNumber)[-3:]) // 250 + 1
        return str(gridNumber)[-5:-3] + '.' + str(int(quot250m))
        
def get100m(gridNumber,xy):
    # Method for 100m grid
    if xy == 'x': 
        # Perform calculations for x
        rest_100m = np.remainder(gridNumber, 1000)
        result_100m = grid100m[int(np.floor(rest_100m / 100))*100]
        return str(result_100m)
    else:
        # Perform calculations for y      
        return str(gridNumber)[-4:-2]

def get50m(gridNumber,xy):
    # Method for 50m grid
    if xy == 'x':
        # Perform calculations for x
        rest_50m = np.remainder(gridNumber, 1000)
        result_50m = grid50m[int(np.floor(rest_50m / 50))*50]
        return str(result_50m)
    else:      
        # Perform calculations for y
        quot50m = (gridNumber - 25) % 1000 / 100 # input grid has 25m offset
        return f"{quot50m:.1f}"  # Ensures one decimal place
        
@qgsfunction(args='auto', group='Custom')            
def getGrid(gridNumber,gridSize,xy, feature, parent):
    gridNumber = int(gridNumber)
    if xy == 'x':
        if gridSize == 25000:
            return get25km(gridNumber,xy)

        elif gridSize == 1000:
            return get25km(gridNumber,xy) + get1km(gridNumber,xy)

        elif gridSize == 250:
            return get1km(gridNumber,xy) + get250m(gridNumber,xy)
        
        elif gridSize == 100:
            return get1km(gridNumber,xy) + get100m(gridNumber,xy)
        
        elif gridSize == 50:
            return get1km(gridNumber,xy) + get50m(gridNumber,xy)
    
    elif xy == 'y':
        if gridSize == 25000:
            return get25km(gridNumber,xy)

        elif gridSize == 1000:
            return get1km(gridNumber,xy)

        elif gridSize == 250:
            return get250m(gridNumber,xy)
        
        elif gridSize == 100:
            return get100m(gridNumber,xy)
        
        elif gridSize == 50:
            return get50m(gridNumber,xy)