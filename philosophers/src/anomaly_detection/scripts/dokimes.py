import random
import threading
import time
import numpy as np

a = np.array([ 1,0,0,1,0,0])
b = np.array([ 1,1,1,0,0,1])

k = b[a==1]

print k[k==1].size
