import numpy as np

class Evaluator:
	
	def __init__(self, behaviours, predictions):
		
		self.__behaviours = behaviours  # 1 for faulty, 0 for non faulty
		self.__predictions = predictions # -1 for faulty, 1 for non faulty
		self.__window = behaviours.size - predictions.size + 1
		self.__reconfigure()
		
	def __reconfigure(self):
		
		self.__predictions = self.__predictions * (-0.5) + 0.5 # now 1 for faulty, 0 for non faulty
		
		if self.__window != 1:
			for i in range(self.__predictions.size):
				
				for j in range(self.__window):
					if self.__behaviours[i+j] == 1:
						self.__behaviours[i] = 1
						break
			self.__behaviours = self.__behaviours[0:self.__predictions.size]
					 
		
b = np.array([1,0,0,0,1,0,1,1,0])
p = np.array([1,-1,-1,-1,1,-1,1])
print b
e = Evaluator(b,p)
