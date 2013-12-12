import numpy as np
import os
import itertools
from gmm_fault_detector import GMMFaultDetector
from analyzer import Analyzer
import datetime
MODELS_DIR = 'TRAINED_MODELS/'
NAME = 'GMM'
class GMMAnalyzer(Analyzer):
	
	def __init__(self, ws_path):
		
		self.__ws_path = ws_path
		
	def create_models(self, trainset, parameters):
		
		# set default windows in case not defined
		if 'windows' not in parameters.keys():  
			windows = [1, 5, 10, 20]
		else:
			windows = parameters['windows']
		
		# set default cut_off percentages in case not defined
		if 'cut_off_range' not in parameters.keys():  
			cut_off_range = {"start":0.5, "end": 0.95, "step": 0.05}
		else:
			cut_off_range = parameters['cut_off_range']
		
		# create the dict with the parameters that are correlated with the estimator's algorithm
		gmm_params = {}  
		for key in parameters.keys():
			if key not in ('windows','cut_off_range'):
				gmm_params[key] = parameters[key]
				
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
		
		name = NAME + "_" + str(datetime.datetime.time(datetime.datetime.now()))   # dir name "GMM_i"
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
				start = cut_off_range["start"]
				end = cut_off_range["end"]
				step = cut_off_range["step"]
				
				f_path = t_path + "comb="+str(i)+"/"
				self._create_dir(f_path)
				# different perc for a specific param combination
				for percentage in self._frange(start, end, step):
					print "PERCENTAGE: %f"% percentage
					
					detector = GMMFaultDetector(params, window, percentage)
					detector.train_classifier(trainset)
					
					detector.export_model(f_path+str(percentage)+".pkl")
				
				f.write(str(i)+"#"+str(params)+"\n")
				
			f.close()	



train_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/TRAINSET_A/results_set.csv'
ws_path = '/home/mike/Dropbox/simeiwseis/Diploma/Outlier_Detection_Karasavvas_Mixalis/EXPERIMENTS/Workspace/'



params = {
	'windows':[1,5],
	"covariance_type":["diag"],
	"n_components":[1,5],
	"cut_off_range": {"start":0.85, "end": 1, "step": 0.05}
}


trainset = np.loadtxt(open(train_path))

a = GMMAnalyzer(ws_path)
a.create_models(trainset[:,49:50], params)





