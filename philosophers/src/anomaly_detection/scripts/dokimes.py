import random

import numpy as np


a = np.array([1,2,3,3,4,5,3,1])
b = np.array([2,3,5,3,4,5,2,1])

print b[a==3][b[a==3] == 5].size 
