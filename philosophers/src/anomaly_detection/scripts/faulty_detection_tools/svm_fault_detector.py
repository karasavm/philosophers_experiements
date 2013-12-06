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
		self.est = self._detector
		
	def train_classifier(self):
		print "---TRAINING---"
		
		self._detector.fit(self._dataset)
		self._trained = 1
		
	def classify_sample(self, samples):
		
		if self._trained == 1:
				return self._detector.predict(samples)
		else:
			print "MODEL HAS NOT BEEN TRAINED YET!"
		
	def load_classifier_params(self, params):
		
		self.__kwparams = params
		self._detector = svm.OneClassSVM(**self.__kwparams)
		self._trained = 0
	
