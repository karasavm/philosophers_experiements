#!/usr/bin/env python
import numpy as np
from svm_fault_detector import SVMFaultDetector
from gmm_fault_detector import GMMFaultDetector
import numpy
import csv
import pickle
import numpy as np
import pylab as pl
import matplotlib.font_manager
import matplotlib.pyplot as plt
from sklearn import svm

def smooth(a, window):
	
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
	
	#test_path =  "/home/mike/experiments/eating_thinking_rates_07:43:16.959136/"
	#test_path =  "/home/mike/experiments/const_05:22:39.803446/"
	#test_path =  "/home/mike/experiments/deny_forks_06:33:02.379401/"
	#test_path =  "/home/mike/experiments/hunger_rates_08:53:31.502341/"
	
	
	#test_path =  "/home/mike/experiments/eating_thinking_rates_15:52:15.966309/"
	test_path =  "/home/mike/experiments/eating_thinking_rates_16:59:00.760174/"

	train_path = "/home/mike/experiments/exp_train_14:32:09.050414/"

	path = '/home/mike/experiments/'
	
	
	dataset = np.loadtxt(open(train_path+'results_set.csv'))
	faultset = np.loadtxt(open(test_path+'results_set.csv'))
	behset  = np.loadtxt(open(test_path+'behaviours_set.csv'))
	
	###################
	trainset = dataset[:,48:50]
	testset = faultset[:,49]
	window = 1
	svm_params = { "nu":0.1, "kernel":"rbf", "gamma":0.1}
	gmm_params = { "n_components":2}
	###################
	
	
	
	
	
	pl.plot(smooth(testset,150))
	pl.plot(testset)
	pl.plot(behset)
	pl.show()
