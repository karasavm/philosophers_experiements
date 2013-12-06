import numpy as numpy
import pickle
import os.path

class FaultDetector:
	
	def __init__(self, data, window):
		
		# protected
		self._window = window
		self._dataset = self.construct_windows(data, window)  
		
		self._detector = None  # implemented on svm/gmm/etc classes
		self._trained = 0
	
	def load_dataset(self, data, windows):
		self._window = window
		self._dataset = self.construct_windows(data, window)
		self._trained = 0  # it only for safety in case you load new dataset and ask for classify without train it first
		
	def construct_windows(self, data, window):
		"""This function convert the dataset into windows
		"""
		if window != 1 :
			samples, features = numpy.shape(data)
			dataset = numpy.empty((0,window*features))
			for i in range(0, samples-window+1):
				d =  data[i:i+window]
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
			
	def load_model(self, name):           # DEN MARESEI. NA RWTISW TON MILTO AN UPARXEI LOGOS GIA KATI TETOIO
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
	
	
	def train_classifier(self):
		raise NotImplementedError	
		
	def classify_sample(self, samples):
		raise NotImplementedError
		
		
	def load_classifier_params(self,params):
		raise NotImplementedError
		

	
	
	
	
	
