import random
import threading
import time
import numpy as np
import pylab as pl
import ast
import itertools
import os

top = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/Workspace/test'

for f in os.walk(top, topdown=True):
	print f
