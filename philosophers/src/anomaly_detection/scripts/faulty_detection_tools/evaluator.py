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
	
	def get_metrics(self, testset, behaviours):
		""" Calculate and returns the fpr and detection rate for the given testset.
		It uses the detector(cosntructor's input) for getting the results.
		
		Args:
			testset: a set of samples.
		"""
		predictions = self.__detector.classify_samples(testset)

		predictions, behaviours = self.__reconfigure(predictions, behaviours)
		
		a = behaviours
		b = predictions.reshape((predictions.size,1))
		
		
		
		
		k = b[a==1]
		detection_rate = round(k[k==1].size/float(a[a==1].size), 2)
		
		k = b[a==0]
		fpr = round(k[k==1].size/float(a[a==0].size), 2)
		
		return detection_rate, fpr
		
		
	def __reconfigure(self, predictions, behaviours):
		
		predictions = predictions * (-0.5) + 0.5 # now 1 for faulty, 0 for non faulty
		window = self.__detector.get_window()
		if window != 1:
			for i in range(predictions.size):
				
				for j in range(window):
					if behaviours[i+j] == 1:
						behaviours[i] = 1
						break
			behaviours = behaviours[0:predictions.size]
		return predictions, behaviours
