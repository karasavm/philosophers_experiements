import numpy
import struct_topics

class PhilosophersData(struct_topics.StructTopics):
	
	def __init__(self, normal_num, faulty_num, path,topics=None):
		
		self.__normal_num = normal_num
		self.__faulty_num = faulty_num
		self.__path = path
		
		self.__topics = {}      # map the name of each topic to an id
		self.__generate_topics()

		self.reset()
		
	def reset(self):
		"""This function reset the data structures of the class. We need this in order to reuse 
		the same class isntance for another experiment.
		"""
		self.__last_topics_values = [0]*( self.__normal_num + self.__faulty_num )
		self.__last_behaviours = [0]*self.__faulty_num  # this is only for watching faulty topics behaviour
		
		self.__recorded_values = numpy.empty( (0, self.__normal_num + self.__faulty_num) )
		self.__recorded_behaviours = numpy.empty( (0, self.__faulty_num) )
		
	def end_of_expermiment(self):
		self.export_results()
		self.reset()
		
	def export_results(self):
		if self.__faulty_num != 0:
			numpy.savetxt(self.__path+'behaviours_set.csv', self.__recorded_behaviours)
		numpy.savetxt(self.__path+'results_set.csv', self.__recorded_values)
		
	def cycle_reached(self):
		"""This fuction get called periodically from a timer on class ExperimentManip when the
		experinment sycle reached in order to record the values_lists. 
		Its records the last_value_list on an array. Produces the data/train set.
		"""
		row = numpy.array(self.__last_topics_values)		
		self.__recorded_values = numpy.vstack( (self.__recorded_values, row) )
		
		if self.__faulty_num != 0:
			row = numpy.array(self.__last_behaviours)
			self.__recorded_behaviours = numpy.vstack( (self.__recorded_behaviours, row) )	
		
	def update_values(self, msg, topic):
		""" We update the list with the last published value in each topic. 
		In case the topic is get published from faulty filosopher we
		update and behaviour list 1/-1.
		
		Args:
			msg: Message type of HungerMsg.msg that constains hunger level and behaviour flag
			topic: the topic that the new msg get published. We use the topic to identify 
			wich position af last_value_list to update
		
		Returns:
			Nothing.
		"""
		self.__last_topics_values[ self.__topics[topic] ] = msg.hungerLevel
		if self.__topics[topic] >= self.__normal_num:
			self.__last_behaviours[ self.__topics[topic] - self.__normal_num ] = int(msg.faulty)
		
	def __generate_topics(self):
		""" Generate the dict with the name of desired topics faulty/normal  and 
		the ids of them.
		"""
		self.__topics = {}
		for i in range(self.__normal_num + self.__faulty_num):
			self.__topics['/hungerLevel/' + str(i)] = i
	

	def get_all_topics(self):
		return self.__topics



