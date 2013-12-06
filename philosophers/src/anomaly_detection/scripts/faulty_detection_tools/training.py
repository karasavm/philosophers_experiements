
#!/usr/bin/env python
import numpy as np
from svm_fault_detector import SVMFaultDetector
import numpy
import csv
from sklearn import svm
import pickle
import numpy as np
import pylab as pl
import matplotlib.font_manager
from sklearn import svm


if __name__ == "__main__":
	
	test_path =  "/home/mike/experiments/deny_forks_18:41:22.559955/"
	train_path = "/home/mike/experiments/exp_train_18:25:58.033918/"

	path = '/home/mike/experiments/'
	
	
	dataset = np.loadtxt(open(train_path+'results_set.csv'))
	testset = np.loadtxt(open(test_path+'results_set.csv'))
	behset  = np.loadtxt(open(test_path+'behaviours_set.csv'))
	
	###################
	dataset = dataset[:,48:50]
	testset = testset[:,48:50]
	window = 1
	params = { "nu":0.001, "kernel":"rbf", "gamma":0.001}
	###################
	
	
	estimator = SVMFaultDetector(dataset, window, params) 
	
	estimator.train_classifier()
	
	results = estimator.classify_sample(testset)
	
	validate = results == behset
	print validate[ validate == True].size
	print validate[ validate == False].size
	

	
