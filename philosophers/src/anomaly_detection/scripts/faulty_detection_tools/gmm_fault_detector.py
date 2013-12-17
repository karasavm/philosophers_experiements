import numpy as np
import csv
from sklearn import mixture
import pickle
from fault_detector import FaultDetector
import pylab as pl


class GMMFaultDetector(FaultDetector):
	
	def __init__(self, params):
		"""This function implements the FaultDetector abstract class and create-initiallizes
		our estimator using the GMM algorithm fro scikit package.
		self._detector is our estimator.
		Arg:
			params: A dictionary with the appropriate params for a GMM estimator.
			window: the width of window.
		"""
		
		# Check for valid parameters
		for key in params.keys():
			if key not in ('window', 'n_components', 'covariance_type', 'cutoff_per'):
				raise ValueError('Wrong key value: %s'%key)
		
		# Initiallize default values
		if 'window' not in params.keys():
			params['window'] = 1
		
		if 'cutoff_per' not in params.keys():
			params['cutoff_per'] = 0.9
		
		if 'n_components' not in params.keys():
			params['n_components'] = 5
		
		# create gmm parameters dictionary
		gmm_params = {}
		for key in params.keys():
			if key not in ('window', 'cutoff_per'):
				gmm_params[key] = params[key]
		
		FaultDetector.__init__(self, params)
		
		self.__cutoff_per = params['cutoff_per']
		self._detector = mixture.GMM(**gmm_params)
		
	def _fit_classifier(self, dataset):
		""" This function train our estimator. The dataset has been created
		from the FaulDetector class using the window width.
		We score the train dataset in order to create a propability threshold to take decisions.
		"""
		self._detector.fit(dataset)
		
		scores = self._detector.score(dataset)
		scores = np.sort(scores)[::-1] ## descent sorting
		self.__threshold = scores[ int(scores.size*self.__cutoff_per) ]
		
	def _predict_sample(self, sample):    
		"""Make the decision for the faultyness of sample.
		
		Args:
			sample: the sample to classify
		
		Return:
			1 for non faulty -2 for faulty.
		"""
		print sample.shape
		score = self._detector.score(sample)
		
		if score >= self.__threshold:
			return 1
		else:
			return -1
		

	def get_detector(self):
		return self._detector
		

