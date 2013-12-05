import numpy as numpy
import pickle
import os.path




class FaultDetector:
	
	def __init__(self, data, window):
		
		# protected
		self._window = window
		self._dataset = self.__construct_windows(data)  
		
		self._detector = None  # implemented on svm/gmm/etc classes
		self._trained = 0
		print self._dataset
	
	def __construct_windows(self, data):
		"""This function convert the dataset into windows
		"""
		if self._window != 1 :
			samples, features = numpy.shape(data)
			dataset = numpy.empty((0,self._window*features))
			for i in range(0, samples-self._window+1):
				d =  data[i:i+self._window]
				row = d[::-1].T.reshape(-1)				
				dataset = numpy.vstack((dataset, row))
			return dataset
		else:
			return data
	
	
	def export_model(self, name):
		"""This function exports the model, object detector, in
		pickle file.
		"""
		if self._trained == 1:
			f = open(name, 'w')
			pickle.dump(self._detector, f, -1)
			f.close()
		else:
			print "MODEL HAS NOT BEEN TRAINED YET!"
			
	def load_model(self, name):           # Δεν μαρέσει γιατί αν φορτωθεί και άσχετο με τις παραμέτρους του
										# οι παράμετροι δεν θα ισχύουν.
		"""This function loads model file
		"""
		if (os.path.exists(name) == True):
			
			f = open(name,'r')
			detector = pickle.load(f) 
			f.close()
			return detector
		else:
			print 'Model file "%s" does not exist.' % name
			return None
	
	
	def trainClassifier(self):
		raise NotImplementedError	
		
	def classifySample(self,testSet2):
		raise NotImplementedError
		


	
	
	
	
