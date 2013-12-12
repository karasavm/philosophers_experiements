import random
import threading
import time
import numpy as np
import pylab as pl
import ast
import itertools
x = {"a":[1,2,3], "b":["cool","gg"]}


def frange(x, y, jump):
  while x < y:
    yield x
    x += jump
    
    
    
for i in frange(0.5,1,0.05):
	print i
