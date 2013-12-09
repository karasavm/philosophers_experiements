import numpy as np
import csv
from sklearn import mixture
import pickle
from fault_detector import FaultDetector
import pylab as pl


class GMMFaultDetector(FaultDetector):
	
	def __init__(self, params, window=1, cutoff_per=0.9):
		"""This function implements the FaultDetector abstract class and create-initiallizes
		our estimator using the GMM algorithm fro scikit package.
		self._detector is our estimator.
		Arg:
			params: A dictionary with the appropriate params for a GMM estimator.
			window: the width of window.
		"""
		FaultDetector.__init__(self, window)
		self.__cutoff_per = cutoff_per
		self._detector = mixture.GMM(**params)
		
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
		"""
		score = self._detector.score(sample)
		
		if score >= self.__threshold:
			return 1
		else:
			return -1
		

	def get_detector(self):
		return self._detector
		

