#!/usr/bin/env python
import numpy
import csv
from sklearn import svm
import pickle
from fault_detector import FaultDetector

class SVMFaultDetector(FaultDetector):
	
	def __init__(self, data, window, params):
		
		FaultDetector.__init__(self, data, window)
		
		print "-----SVM------"	
		
		self.__kwparams = params
		self._detector = svm.OneClassSVM(**self.__kwparams)
		
		
	def trainClassifier(self):
		print "---TRAINING---"
		
		self._detector.fit(self._dataset)
		self._trained = 1
		
	def classifySample(self, sample):
		
		if self._trained == 1:
				return self._detector.predict(sample)
		else:
			print "MODEL HAS NOT BEEN TRAINED YET!"
		
	
			
	
if __name__ == "__main__":
	
	TEST_PATH =  "/home/mike/experiments/const_18:25:51.368025/"
	TRAIN_PATH = "/home/mike/experiments/exp_train_18:25:58.033918/"

	path = '/home/mike/experiments/'
	
	
	
	
