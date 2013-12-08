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


if __name__ == "__main__":
	
	#test_path =  "/home/mike/experiments/eating_thinking_rates_09:41:33.280992/"
	#test_path =  "/home/mike/experiments/const_07:40:04.251017/"
	#test_path =  "/home/mike/experiments/deny_forks_08:40:48.759628/"
	test_path =  "/home/mike/experiments/hunger_rates_10:42:17.784163/"

	train_path = "/home/mike/experiments/exp_train_14:32:09.050414/"

	path = '/home/mike/experiments/'
	
	
	dataset = np.loadtxt(open(train_path+'results_set.csv'))
	faultset = np.loadtxt(open(test_path+'results_set.csv'))
	behset  = np.loadtxt(open(test_path+'behaviours_set.csv'))
	
	###################
	trainset = dataset[:,48]
	testset = faultset[:,1]
	window = 1
	svm_params = { "nu":0.1, "kernel":"rbf", "gamma":0.1}
	gmm_params = { "n_components":2}
	###################
	
	
	pl.plot(testset)
	#pl.plot(trainset)
	
	pl.show()
	
	#experimenter = SVMFaultDetector(svm_params, window)
	#experimenter.train_classifier(trainset)
	
	
