import numpy as np
import os
import itertools
from svm_fault_detector import SVMFaultDetector
from analyzer import Analyzer
import datetime

MODELS_DIR = 'TRAINED_MODELS/'
NAME = 'svm'
class SVMAnalyzer(Analyzer):
	
	def __init__(self, ws_path):
		
		self.__ws_path = ws_path
		
	def create_models(self, trainset, svm_params, windows):
		
		# set default windows in case not defined
		if windows == None:  
			windows = [1, 5, 10, 20]
		
				
		# set default nu in case not defined
		if 'nu' not in svm_params.keys():  
			svm_params['nu'] = [1, 0.1, 0.01]
			
		# set default kernel in case not defined
		if 'kernel' not in svm_params.keys():  
			svm_params['kernel'] = ['rbf']
			
		# set default gamma in case not defined
		if 'gamma' not in svm_params.keys():  
			svm_params['gamma'] = [0, 0.1]
		
		# grid list with all the combination of desired params for the estimator
		grid_params = self._create_grid_params(svm_params)
		
		# create description
		description = {}
		description['NAME'] = NAME
		description['PARAMS'] = svm_params
		description['WINDOWS'] = windows
		description['TRAINSET'] = str(trainset.shape)

	
		# create the directory to put the trained models
		models_path = self.__ws_path + MODELS_DIR   
		for i in range(1000):
			gname = NAME + str(i)  # group name for instance "svm1"
			if self._create_dir(models_path+gname):   # svmi doesnt exist so we create it
				self._create_desc(models_path+gname+".txt",description)
				break
		
		gpath = models_path+gname+"/" # group path   eg svm3
		
		# export parameter combination file
		f = open(gpath+gname+'_params_comb.txt','w')
		for i,params in enumerate(grid_params):
			f.write(str(i)+"#"+str(params)+"\n")
		f.close()
		
		# for each window
		for window in windows:
			wname = "w"+str(window)
			wpath = gpath+wname+"/"
			self._create_dir(wpath)

			# for its param combination on grid
			for i,params in enumerate(grid_params):  # i is the combination id
				
				cname = "c"+str(i)
				print "WINDOW:%d param:%d"%(window,i)
				print str(params)

				detector = SVMFaultDetector(params, window)
				detector.train_classifier(trainset)
				
				name =gname+wname+cname
				detector.export_model(wpath+name+".pkl")
				
			f.close()	





