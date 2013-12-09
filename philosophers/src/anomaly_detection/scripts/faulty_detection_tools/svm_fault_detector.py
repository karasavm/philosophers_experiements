import numpy
import csv
from sklearn import svm
import pickle
from fault_detector import FaultDetector

class SVMFaultDetector(FaultDetector):
	def __init__(self, params, window=1):
		"""This function implements the FaultDetector abstract class and create-initiallizes
		our estimator using the OneClassSVM algorithm fro scikit package.
		self._detector is our estimator.
		Arg:
			params: A dictionary with the appropriate params for an OneClassSVM estimator.
			window: the width of window.
		"""
		FaultDetector.__init__(self, window)
		self._detector = svm.OneClassSVM(**params)
		
	def _fit_classifier(self, dataset):
		""" This function train our estimator. The dataset has been created
		from the FaulDetector class using the window width
		"""
		self._detector.fit(dataset)
	
	def _predict_sample(self, sample):         ################################
		"""Make the decision for the faultyness of sample.
		"""
		return self._detector.predict(sample)

	def get_detector(self):
		return self._detector
