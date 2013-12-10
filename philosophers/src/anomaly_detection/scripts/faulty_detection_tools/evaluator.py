import numpy as np
import fault_detector

class Evaluator:
	"""It is a class that evaluates with fpr and detection rate metrics a test set.
	The results from the testing are taken form a specific FaulDetector Object. 
	"""
	def __init__(self, detector):
		"""Initiallize the Evaluator instance. 
		
		Args:
			detector: a FaultdDetector instance that will classify the samples from a given testset.
		"""
		self.__detector = detector
	
	def get_evaluations(self, testset, behaviours):
		""" Calculate and returns the fpr and detection rate for the given testset.
		It uses the detector(cosntructor's input) for getting the results.
		
		Args:
			testset: a set of samples.
		"""
		predictions = self.__detector.classify_samples(testset)

		predictions, behaviours = self.__reconfigure(predictions, behaviours)
		
		a = behaviours
		b = predictions
		
		k = b[a==1]
		detection_rate = k[k==1].size/a[a==1].size
		
		k = b[a==0]
		fpr = k[k==1]/a[a==0].size
		
		return detection_rate, fpr
		
		
	def __reconfigure(self, predictions, behaviours):
		
		predictions = predictions * (-0.5) + 0.5 # now 1 for faulty, 0 for non faulty
		
		if self.__detector.get_window() != 1:
			for i in range(predictions.size):
				
				for j in range(self.__window):
					if behaviours[i+j] == 1:
						behaviours[i] = 1
						break
			behaviours = behaviours[0:predictions.size]
		return predictions, behaviours
