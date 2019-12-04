import math
import numpy as np
from numpy import *
from os import path
import sys

outpath = ""
inpath = ""

n, AxialCurrent = np.loadtxt(path.join(inpath, "xx02"), usecols=(0, 1), unpack=True)

file = open("xx04", "w")
print('#	Axial curent on Z-axis direction', file=file)
if (len(AxialCurrent) != 25) :
	print(np.mean(AxialCurrent), (np.std(AxialCurrent, ddof=1) / sqrt(len(AxialCurrent))), file=file)
else :
	print("nan", "nan", file=file)
print(file=file)