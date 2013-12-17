import os
import numpy as np
def frange(x, y, jump):
	"""The same as range but for floating-point numbers.
	
		Args:
			x: start range from
			y: end range to y
			jump: step size
		
		Returns:
			A sequence from x to y with step size jump.
	"""
	res = []
	while x < y:
		res.append(x)
		x += jump	
	return res

def get_filepaths(directory):
	"""This function will generate the file names in a directory 
	tree by walking the tree either top-down or bottom-up. For each 
	directory in the tree rooted at directory top (including top itself), 
	it yields a 3-tuple (dirpath, dirnames, filenames).
	"""
	
	file_paths = []  # List which will store all of the full filepaths.
	
	# Walk the tree.
	for root, directories, files in os.walk(directory):
	
	    for filename in files:
	
	        # Join the two strings in order to form the full filepath.
	        #filepath = os.path.join(root, filename)
	
	        file_paths.append((root, filename))  # Add it to the list.
	
	return file_paths  # Self-explanatory.


def construct_windows( data, window):
		"""This function convert the dataset into windows.
		It has to be called at train_classifier() function in order to convert the dataset.
		
		Arg:
			data: The initial dataset that will train the classifier. (type of np.array(), shape=(n,1) ))
		"""
		if window != 1 :
			samples, features = np.shape(data)
			dataset = np.empty((0,window*features))
			for i in range(0, samples-window+1):
				d =  data[i:i+window]
				row = d[::-1].T.reshape(-1)				
				dataset = np.vstack((dataset, row))
			return dataset
		else:
			return data
			
def smooth(a, window):
	"""
	Calculate the moving average of a vector with a prefered window.
		
	
	Args:
		a: the vector we want to calculate the moving average.
		window: moving average window size.
	
	Returns:
		A smoothed version of a!!!
	"""	
	
	if a.size < window:
		return None
	
	r = np.zeros(a.size-window-1)
	
	for i in range(a.size-window-1):
		s = 0
		for j in range(window):
			s = s + a[i+j]
		r[i] = s/window
	return r
