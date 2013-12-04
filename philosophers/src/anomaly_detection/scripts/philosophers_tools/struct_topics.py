class StructTopics:
		""" Abstract class implementation. SImulates the way
		that we want to experiment with topics. e.g HungerTopics.
		see HungetTopics for more information
		"""
		def __init__(self):
			raise NotImplementedError
			
		def update_values(self, msg, topic):
			raise NotImplementedError
		
		def cycle_reached(self):
			raise NotImplementedError
	
		def get_all_topics(self):
			raise NotImplementedError
		
		def end_of_expermiment(self,path):
			raise NotImplementedError
			
