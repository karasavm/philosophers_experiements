import numpy as np
import os
import itertools
from gmm_fault_detector import GMMFaultDetector
from analyzer import Analyzer
import datetime
MODELS_DIR = 'TRAINED_MODELS/'
NAME = 'gmm'
class GMMAnalyzer(Analyzer):
	
	def __init__(self, ws_path):
		
		self.__ws_path = ws_path

	def create_models(self, trainset, gmm_params=None, windows=None, cut_off_range=None):

		# set default windows in case not defined
		if windows == None:  
			windows = [1, 5, 10, 20]
		
		# set default cut_off percentages in case not defined
		if cut_off_range==None:
			cut_off_range = {"start":0.8, "end": 0.95, "step": 0.05}
		
			
		# set default n_components in case not defined
		if 'n_components' not in gmm_params.keys():  
			gmm_params['n_components'] = [5, 10, 20]
		
		# grid list with all the combination of desired params for the estimator
		grid_params = self._create_grid_params(gmm_params)
		
		# create description
		
		description = {}
		description['NAME'] = NAME
		description['PARAMS'] = gmm_params
		description['WINDOWS'] = windows
		description['CUT_OFF_PERCENTAGES'] = cut_off_range
		description['TRAINSET'] = str(trainset.shape)

		# create the directory to put the trained models
		models_path = self.__ws_path + MODELS_DIR   
		for i in range(1000):
			gname = NAME + str(i)  
			if self._create_dir(models_path+gname):   # gmmi doesnt exist so we create it
				self._create_desc(models_path+gname+".txt",description)
				break
		
		gpath = models_path+gname+"/" # group path
		
		# export parameter combination file
		f = open(gpath+gname+'_params_comb.txt','w')
		for i,params in enumerate(grid_params):
			f.write(str(i)+"#"+str(params)+"\n")
		f.close()
		
		for window in windows:
			wname = "w"+str(window)
			wpath = gpath+wname+"/"
			self._create_dir(wpath)
			
			
			
			# for its param combination on grid
			for i,params in enumerate(grid_params):
				
				print "WINDOW:%d param:%d"%(window,i)
				print str(params)
				start = cut_off_range["start"]
				end = cut_off_range["end"]
				step = cut_off_range["step"]
				
				cname = "c"+str(i)
				
				# different perc for a specific param combination
				for percentage in self._frange(start, end, step):
					print "PERCENTAGE: %f"% percentage
					
					detector = GMMFaultDetector(params, window, percentage)
					detector.train_classifier(trainset)
					
					name =gname+wname+cname
					detector.export_model(wpath+name+"p"+str(percentage)+".pkl")
				
				
				
			f.close()	


	
