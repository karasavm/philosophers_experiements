import numpy as np
import os
import itertools
from svm_fault_detector import SVMFaultDetector
from analyzer import Analyzer
import datetime

MODELS_DIR = 'TRAINED_MODELS/'
NAME = 'SVM'
class GMMAnalyzer(Analyzer):
	
	def __init__(self, ws_path):
		
		self.__ws_path = ws_path
		
	def create_models(self, trainset, parameters):
		
		# set default windows in case not defined
		if 'windows' not in parameters.keys():  
			windows = [1, 5, 10, 20]
		else:
			windows = parameters['windows']
		
		# create the dict with the parameters that are correlated with the estimator's algorithm
		svm_params = {}  
		for key in parameters.keys():
			if key not in ('windows'):
				svm_params[key] = parameters[key]
				
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
		
		name = NAME + "_" + str(datetime.datetime.time(datetime.datetime.now()))   # dir name "SVM_i"
		self._create_dir(models_path+name)
		self._create_desc(models_path+name+".txt",description)
				
		
		c_path = models_path+name+"/" # current path
		for window in windows:
			
			t_path = c_path+"window="+str(window)+"/"
			self._create_dir(t_path)
			
			f = open(t_path+'params_combinations.txt','w')
			
			# for its param combination on grid
			for i,params in enumerate(grid_params):
				
				print "WINDOW:%d param:%d"%(window,i)
				print str(params)
				
				
				f_path = t_path + "comb="+str(i)+"/"
				self._create_dir(f_path)
				
					
				detector = SVMFaultDetector(params, window)
				detector.train_classifier(trainset)
				
				detector.export_model(f_path+"svm.pkl")
				
				f.write(str(i)+"#"+str(params)+"\n")
				
			f.close()	



train_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/TRAINSET_A/results_set.csv'
ws_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/Workspace/'



params = {
	'windows':[1,5,10],
	"nu":[1,0.1],
	"kernel":['rbf'],
	"gamma": [0, 0.1]
}


trainset = np.loadtxt(open(train_path))

a = GMMAnalyzer(ws_path)
a.create_models(trainset[:,49:50], params)





