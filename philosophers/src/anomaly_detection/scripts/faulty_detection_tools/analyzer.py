import numpy as np
import os
import itertools
from gmm_fault_detector import GMMFaultDetector
class Analyzer:
	
	def __init__(self):
		pass

	def create_models(self, parameters):
		raise NotImplementedError 
	
	
	#def __create_gmm_models(self, parameters, path):
		
		#name = 'GMM'
		
		#if 'windows' not in parameters.keys():  # set default windows in case not defined
			#windows = [1, 5, 10, 20]
		#else:
			#windows = parameters['windows']
		
		#if 'cut_off_range' not in parameters.keys():  # set default  in case not defined
			#cut_off_range = {"start":0.5, "end": 0.95, "step": 0.05}
		#else:
			#cut_off_range = parameters['cut_off_range']
		
		#gmm_params = {}
		#for key in parameters.keys():
			#if key not in ('windows','cut_off_range'):
				#gmm_params[key] = parameters[key]
		
		
		#if 'n_components' not in gmm_params.keys():  # set default n_components in case not defined
			#gmm_params['n_components'] = [5, 10, 20]
		
		
		#grid_params = self.__create_grid_params(gmm_params)
		#print "WINDOWS:%d GRID PARAMS:%d"%(len(windows), len(grid_params)) 
		
		#self.__create_dir(path+name)
		
		#traiset = np.loadtxt(open(self.__train_path))[:,49:50]
		
		#for window in windows:
			
			#t_path = path+name+"/window="+str(window)+"/"
			#self.__create_dir(t_path)
			
			#f = open(t_path+'params.txt','w')
			
			#for i,params in enumerate(grid_params):
				
				#print "WINDOW:%d param:%d"%(window,i)
				#print str(params)
				#start = cut_off_range["start"]
				#end = cut_off_range["end"]
				#step = cut_off_range["step"]
				
				#f_path = t_path + "comb="+str(i)+"/"
				#self.__create_dir(f_path)
				#for percentage in self.__frange(start, end, step):
					#print "PERCENTAGE: %f"% percentage
					
					#detector = GMMFaultDetector(params, window, percentage)
					#detector.train_classifier(traiset)
					
					#detector.export_model(f_path+str(percentage)+".pkl")
				
				#f.write(str(i)+"#"+str(params)+"\n")
				
			#f.close()	
			
			
			
	def _create_desc(self, name, desc):
		
		f = open(name, 'w')
		for key in desc.keys():
			f.write(key+": "+str(desc[key])+"\n")
			
		f.close()
	def _frange(self,x, y, jump):
		while x < y:
			yield x
			x += jump		
		
	def _create_grid_params(self, params):
		
		
		keys = params.keys()
		tlist = []
		for key in keys:
			tlist.append(params[key])
		
		grid = []
		for param in itertools.product(*tlist):
			grid.append({key:param[i] for i,key in enumerate(keys)})
		
		return grid
		
	def _create_dir(self,path):
		if not os.path.exists(path):
			os.mkdir(path)
			return True
		return False
	
	
			
	def _get_exp_paths(self, ws_path):
		return os.listdir(ws_path)
		
		











