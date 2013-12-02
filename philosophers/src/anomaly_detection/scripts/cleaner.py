#!/usr/bin/python
import os
import glob
import sys



a = [0,1,2,3,4]

for arg in sys.argv[1:]:
	
	for files in glob.glob("*."+arg):
		os.remove(files)
