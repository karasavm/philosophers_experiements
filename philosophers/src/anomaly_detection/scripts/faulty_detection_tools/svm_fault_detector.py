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
		
		# Check for valid parameters
		for key in params.keys():
			if key not in ('window', 'gamma', 'nu', 'kernel'):
				raise ValueError('Wrong key value: %s'%key)
		
		# Initiallize default values
		if 'window' not in params.keys():
			params['window'] = 1
		
		if 'gamma' not in params.keys():
			params['gamma'] = 0.1
		
		if 'nu' not in params.keys():
			params['nu'] = 0.1
			
		if 'kernel' not in params.keys():
			params['kernel'] = 'rbf'
		
		# create svm parameters dictionary
		svm_params = {}
		for key in params.keys():
			if key not in ('window'):
				svm_params[key] = params[key]		
		
		FaultDetector.__init__(self, params)
		self._detector = svm.OneClassSVM(**svm_params)
		
	def _fit_classifier(self, dataset):
		""" This function train our estimator. The dataset has been created
		from the FaulDetector class using the window width
		"""
		self._detector.fit(dataset)
	
	def _predict_sample(self, sample):         
		"""Make the decision for the faultyness of sample.
		
		Args:
			sample: the sample to classify
		
		Return:
			1 for non faulty -2 for faulty.
		"""
		return self._detector.predict(sample)

	def get_detector(self):
		return self._detector
