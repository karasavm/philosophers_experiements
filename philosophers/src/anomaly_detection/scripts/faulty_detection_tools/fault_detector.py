import numpy as np
import pickle
import os.path

class FaultDetector:
	
	def __init__(self, window):
		"""Initializes the abstract FaultDetector. 
		Args:
			window: The size(positive) of desired window. (type of integer)
		"""
		
		self.__window_size = window
		self.__test_window_size = 0     
		self._trained = 0
		
		
	def train_classifier(self, data):
		"""This function train our model. It uses the implementation of abstract function
		_fit_classifier()
		
		Args:
			data: the initial dataset before the windows construction (type of array)
		"""
		self._trained = 1
		dataset = self._construct_windows(data)
		self._fit_classifier(dataset) 
		
	def classify_sample(self, sample):
		
		
		row, features = sample.shape
		if row != 1:
			print "Wrong number of samples!!"
			return None
		"""Is classify the sample using the implementation of abstract function
		_predit_sample()
		
		Args:
			sample: The sample we want to classify,a feature vector. (type of array)
		
		Returns:
			1: For a non faulty value.
			-1: For a faulty value
			None: Untill it receives all the (window_size -1) samples.
		"""
		
		if self._trained == 1:
			if self.__window_size == 1:
				return self._predict_sample(sample)
			else:
				if self.__test_window_size == self.__window_size - 1:   # we have complete the window
	
					self.__window_stack = np.vstack((self.__window_stack,sample))
					
					row = self._construct_windows(self.__window_stack)
					prediction = self._predict_sample(row)
					self.__window_stack = self.__window_stack[1:,:] # delete oldest sample
					return prediction
				else:
					if self.__test_window_size == 0:
						
						self.__window_stack = sample
						self.__test_window_size += 1
						return None
					else:
						self.__window_stack = np.vstack((self.__window_stack,sample))
						self.__test_window_size += 1
						return None
		else:
			print "MODEL HAS NOT BEEN TRAINED YET!"
			return None
		
	def classify_samples(self, samples):
		"""Classify a set of samples.
		
		Args:
			samples: Vector with samples.
		
		Returns:
			A vector with the decision for each sample(1/-1).
		"""
		
		predictions = np.empty((0,0))
		for sample in samples:
			
			sample = sample.reshape((1,sample.size))   # priblem with vectors shape (num,) -->>  (1,num)
			pred = self.classify_sample(sample)
			if pred != None:
				predictions = np.append(predictions,pred,)
		return predictions
		
	def export_model(self, name):
		"""This function exports to a pickle file the implemented FaultDetector object.
		It exports the self "variable".
		
		Args:
		
			name: The name/path of exporting file. (type of string)
		"""
		if self._trained == 1:  
			f = open(name, 'w')
			pickle.dump(self, f, -1)
			f.close()
		else:  
			print "MODEL HAS NOT BEEN TRAINED YET!"
			
	@staticmethod	
	def load_model(name):           
		"""It is a static function, loads and returns from a pickle file an
		implemented FaultDetector object.
		
		Args:
			name: The name of file to load. (type of string)
			
		Returns: 
			An implemented FauldDetector object. (type of the implementation e.g. OneClassSVM, GMM)
		"""
		if (os.path.exists(name) == True):			
			f = open(name,'r')
			obj = pickle.load(f) 
			f.close()
			return obj
		else:
			print 'Model file "%s" does not exist.' % name
			return None
	
		
	def _construct_windows(self, data):
		"""This function convert the dataset into windows.
		It has to be called at train_classifier() function in order to convert the dataset.
		
		Arg:
			data: The initial dataset that will train the classifier. (type of np.array())
		"""
		
		if self.__window_size != 1 :
			samples, features = np.shape(data)
			dataset = np.empty((0,self.__window_size*features))
			for i in range(0, samples-self.__window_size+1):
				d =  data[i:i+self.__window_size]
				row = d[::-1].T.reshape(-1)				
				dataset = np.vstack((dataset, row))
			return dataset
		else:
			return data
	

	def _fit_classifier(self):
		"""Abstract function. The implementation will train the classifier.
		"""
		raise NotImplementedError	
		
	def _predict_sample(self, samples):
		"""Abstract funtion. The implementation will classify the samples.
		
		Args:
			samples: The samples we want to classify. (type of array)
		
		Returns:
			1: For a non faulty sample.
			-1:For a faulty value.
		"""
		raise NotImplementedError
		
	
		

	
	
	
	
	
