#!/usr/bin/env python
import numpy as np

import numpy
import numpy as np
import pylab as pl

from sklearn import svm
from sklearn import mixture

from svm_fault_detector import SVMFaultDetector
from gmm_fault_detector import GMMFaultDetector

from fault_detector import FaultDetector

import evaluator

def smooth(a, window):
	"""Calculate the moving average of a vector with a prefered window.
		
	
		Args:
			a: the vector we want to calculate the moving average.
			window: moving average windo size.
		
		Returns:
			A smoothed version of a!!!
	"""
	
	if a.size < window:
		return
	
	r = np.zeros(a.size-window-1)
	
	for i in range(a.size-window-1):
		s = 0
		for j in range(window):
			s = s + a[i+j]
		r[i] = s/window
	return r
	
	
if __name__ == "__main__":
	
	#test_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/EXPERIMENT_A/hunger_rates_b_02:25:06.705302/'
	#test_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/EXPERIMENT_A/hunger_rates_a_00:30:36.997247/'
	#test_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/EXPERIMENT_A/eating_thinking_rates_23:20:10.465724/'
	test_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/EXPERIMENT_A/const_21:26:38.100732/'
	#test_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/EXPERIMENT_A/deny_forks_03:28:26.395999/'

	train_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/TRAINSET_A/'

	dataset = np.loadtxt(open(train_path+'results_set.csv'))
	faultset = np.loadtxt(open(test_path+'results_set.csv'))
	behset  = np.loadtxt(open(test_path+'behaviours_set.csv'))
	
	###################
	trainset = dataset[:,49:50]	
	testset = faultset[:,49:50]
	window = 10
	svm_params = { "nu":0.01, "kernel":"rbf", "gamma":0.1}
	gmm_params = { "n_components":10}
	###################
	
	
	cutoff_per = 0.3
	dr = np.empty((1,))
	fpr = np.empty((1,))
	
	for i in range(14):
		print i
		detector = GMMFaultDetector(gmm_params, window, cutoff_per)
		
		detector.train_classifier(trainset)
		
		e = evaluator.Evaluator(detector)
		d, f = e.get_metrics(testset, behset)
		dr = np.append(dr,d)
		fpr = np.append(fpr,f)
		cutoff_per += 0.05
	print fpr,dr
	pl.subplot(211)
	pl.plot(fpr,dr)
	pl.xlabel('fpr')
	pl.ylabel('detection rate')
	pl.title('GMM(10components) one philosopher 30%-95%')
	
	pl.subplot(212)
	pl.plot(testset)
	pl.xlabel('time')
	pl.ylabel('hunger level')
	pl.title('Philosophers Hunger')
	
	pl.show()
