import numpy as np
import evaluator
import pylab as pl
import mylibrary
class ROC:
	

	def __init__(self, metrics, var_param, const_params):
		
		self.__fpr = np.empty((0,1))
		self.__dr = np.empty((0,1))
		
		for metric in metrics:
			self.__fpr = np.append(self.__fpr, metric['fpr'])
			self.__dr = np.append(self.__dr, metric['detection_rate'])
		
		
		self.__var_param = var_param
		self.__const_params = const_params
		
		print self.__fpr
		print self.__dr
		
	def create_roc(self):
		
		pl.figure()
		self.__iscomputed = True

		
		ind = np.argsort( self.__dr )
		self.__fpr = self.__fpr[ind]
		self.__dr = self.__dr[ind]
		
		ind = np.argsort( self.__fpr )
		self.__dr = self.__dr[ind]
		self.__fpr = self.__fpr[ind]
		
		k = mylibrary.frange(0,1,0.1)
		pl.plot(k,k)
		pl.plot(self.__fpr, self.__dr)
		

		
	def export_roc(self, name):
		
		# find the parameter that changes
		
		const_params = {}
		var_param = None
		var_list = []
		
		par1 = self.__evaluators[0].get_detector().get_params()
		par2 = self.__evaluators[1].get_detector().get_params()
		
		for key in par1.keys():
			if par1[key] == par2[key]:
				const_params[key] = par2[key]
			else:
				var_param = key
		
		for evaluator in self.__evaluators:
			params = evaluator.get_detector().get_params()
			var_list.append(params[var_param])
		
		var_list = sorted(var_list)
		
		
		pl.figure
		pl.title("ROC curve:\n"+str(const_params))
		pl.xlabel("fpr\n"+var_param+"="+str(var_list))
		pl.ylabel("detaction_rate")
		
		best = self.get_best_points(1)
		pl.figtext(0,0,"4324324")#var_param+"="+str(best[0][2].get_params()[var_param]))
		
		pl.scatter(best[0][1],best[0][0],c='r',marker='x')
		
		
		pl.plot(self.__results[:,1],self.__results[:,0])
		
		k = mylibrary.frange(0,1,0.1) 
		pl.plot(k,k)
		
		pl.savefig(name)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
