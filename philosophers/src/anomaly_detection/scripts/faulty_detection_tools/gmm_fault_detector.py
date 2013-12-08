import numpy as np
import csv
from sklearn import mixture
import pickle
from fault_detector import FaultDetector
import pylab as pl


class GMMFaultDetector(FaultDetector):
	
	def __init__(self, params, window=1, cutoff_per=0.9):
		
		FaultDetector.__init__(self, window)
		self.__cutoff_per = cutoff_per
		self._detector = mixture.GMM(**params)
		
	def _fit_classifier(self, dataset):
		
		self._detector.fit(dataset)
		scores = self._detector.score(dataset)
		scores = np.sort(scores)[::-1] ## descent sorting
		self.__threshold = scores[ int(scores.size*self.__cutoff_per) ]
		
	def _predict_sample(self, sample):    
	  
		score = self._detector.score(sample)
		
		if score >= self.__threshold:
			return 1
		else:
			return -1
		

	def get_detector(self):
		return self._detector
		

