import numpy
import csv
from sklearn import svm
import pickle
from fault_detector import FaultDetector

class SVMFaultDetector(FaultDetector):
	def __init__(self, params, window=1):
		FaultDetector.__init__(self, window)
		self._detector = svm.OneClassSVM(**params)
		
	def _fit_classifier(self, dataset):
		self._detector.fit(dataset)
	
	def _predict_sample(self, sample):         ################################
		return self._detector.predict(sample)

	def get_detector(self):
		return self._detector
