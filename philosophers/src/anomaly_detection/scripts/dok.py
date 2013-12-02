#!/usr/bin/env python
import pylab 
import numpy
import matplotlib.pyplot as plt
import sys
import subprocess
import os
from collections import OrderedDict
import xml.etree.ElementTree as et
import time
import signal
import shutil

import thread
import datetime



def fun(arg):
	print 'mpike'
	time.sleep(4)
	print 'vgike'
	
	
	
thread.start_new_thread(fun,(2,))


time.sleep(1)
