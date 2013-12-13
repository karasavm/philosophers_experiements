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

from svm_analyzer import SVMAnalyzer
from gmm_analyzer import GMMAnalyzer

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
	
	
	ws_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/Workspace/'
	
	
	
	#params = {
		#'windows':[1,5,10,15,20],
		#"nu":[0.01,0.1,0.4,0.5,0.6,0.8,0.9,1],
		#"kernel":['rbf'],
		#"gamma": [0, 0.1, 0.5, 1, 1.5, 5, 10, 20]
	#}
	
	
	#trainset = dataset[:,49:50]
	#a = SVMAnalyzer(ws_path)
	
	#a.create_models(trainset, params)
	
	
	#params = {
		#'windows':[1,5,10,15,20],
		#"n_components":[1,5,10,15,20],
		#"covariance_type": ["full", "diag"]
	#}
	
	#trainset = dataset[:,49:50]
	
	#a = GMMAnalyzer(ws_path)
	#print dataset.shape
	#a.create_models(trainset, params)
	
	
	
	#params = {
		#'windows':[1,5,10,15,20],
		#"nu":[0.01,0.1,0.4,0.5,0.6,0.8,0.9,1],
		#"kernel":['rbf'],
		#"gamma": [0,0.1, 0.5, 1, 1.5, 5, 10, 20]
	#}
	
	
	#trainset = dataset[:,48:50]
	#a = SVMAnalyzer(ws_path)
	
	#a.create_models(trainset, params)
	
	
	
	
	#params = {
		#"n_components":[1,5,10,15,20],
		#"covariance_type": ["full", "diag"]
	#}
	
	#trainset = dataset[:,48:50]
	
	#a = GMMAnalyzer(ws_path)
	#a.create_models(trainset, params,windows=[1,5,10,15,20])
	
	###################################################################
	
	
	params = {
		"n_components":[1,5],
		"covariance_type": ["diag"]
	}
	
	trainset = dataset[:,49:50]
	
	a = GMMAnalyzer(ws_path)
	a.create_models(trainset, params,windows=[1,5])
	
	#params = {
		#"nu":[0.01,0.1,0.4],
		#"kernel":['rbf'],
		#"gamma": [0,0.1, 0.5, 1]
	#}
	
	
	#trainset = dataset[:,49:50]
	#a = SVMAnalyzer(ws_path)
	
	#a.create_models(trainset, params, windows = [1,2,3])
