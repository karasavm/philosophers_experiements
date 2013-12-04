import sys
import numpy as numpy
import csv
from sklearn import svm
import pickle
from collections import OrderedDict



TEST_PATH =  "/home/mike/experiments/const_18:25:51.368025/"
TRAIN_PATH = "/home/mike/experiments/exp_train_18:25:58.033918/"


class FaultyDetector:
	
	def __init__(self, data, window):
		
		# protected
		self._window = window
		self._dataset = self.__construct_windows(data)  
		
		print self._dataset
	
	def __construct_windows(self, data):
		"""This function convert the dataset into windows
		"""
		if self._window != 1 :
			samples, features = numpy.shape(data)
			dataset = numpy.empty((0,self._window*features))
			for i in range(0, samples-self._window+1):
				d =  data[i:i+self._window]
				row = d[::-1].T.reshape(-1)				
				dataset = numpy.vstack((dataset, row))
			return dataset
		else:
			return data
	
	def trainClassifier(self,convertedDataSet):
		raise NotImplementedError	
		
	def classifySample(self,testSet2):
		raise NotImplementedError
		

if __name__ == "__main__":
	
	
	a = numpy.array( [[1,2,5],[3,5,4],[5,7,6],[7,2,8],[9,5,8],[7,7,6],[8,5,4],[3,2,2]] )
	
	cf = FaultyDetector(a,4)
	
	
	
	
