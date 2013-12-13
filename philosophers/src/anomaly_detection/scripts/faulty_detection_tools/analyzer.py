import numpy as np
import os
import itertools
from gmm_fault_detector import GMMFaultDetector
class Analyzer:
	
	def __init__(self):
		pass

	def create_models(self, parameters):
		raise NotImplementedError 
	
			
			
			
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
		
		











