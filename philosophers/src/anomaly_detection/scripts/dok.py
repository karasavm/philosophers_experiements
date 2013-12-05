#!/usr/bin/env python
import numpy
import csv
from sklearn import svm
import pickle




class A():
	def __init__(self):
		pass
		self.a = 4
	def fun(self,h):
		print "hello",h
		



f = open("/home/mike/experiments/temp.pkl",'w')

a = A()
pickle.dump(a,f,-1)
f.close()

f = open("/home/mike/experiments/temp.pkl",'r')

k = pickle.load(f)

k.fun(77)
if (os.path.exists(file_path) == True)
