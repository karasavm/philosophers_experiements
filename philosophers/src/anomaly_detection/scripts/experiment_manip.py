import rospy
import numpy
import os
import signal
import struct_topics

from dining_philosopher_communications.msg import hungerMsg

class ExperimentManip(struct_topics.StructTopics):
	"""This class is an experiment manipulator. You have to tell it the experiment duration, the full name of topics
	you want to listen to, sampling time and a struct topic. It listen to specific topic and for each sampling cycle
	it update the struct_topic. When the experiment time reached it makes a log file and terminate the experiment.
	For more information about struct_topics look to the apropriate modules. 
	"""
	
	def __init__(self, name, experim_topics):
		
		self.__experim_topics = experim_topics

		self.__WAIT_TIME = 2 # The time we are waiting for topics to get published		
		self.__node_name = name
		
		self.__sampling_time = rospy.get_param("/experiment/sampling_time",0.5)
		self.__experiment_duration = rospy.get_param("/experiment/duration",10)
		self.__eperiment_path = rospy.get_param("/experiment/logs")
		
		self.__subscribers = list()  # A list with the subscribers to desired topics
		self.__sampler = None
		
		rospy.init_node(self.__node_name) # initialize ros node
		rospy.loginfo('NODE INITIALIZED.')
		rospy.sleep(1)  # give time for node to be initialized

	def terminate(self):
		"""We have reached the experiment's duration time. Log the details to file. Send a signal
		to os in order to stop the process.
		"""
		rospy.loginfo('TERMINATING NODE. ');
		rospy.loginfo('TERMINATE SAMPLER.');
		if self.__sampler != None:
			self.__sampler.shutdown()  # Stop the timer who is responsible for sampling and recording
		
		rospy.loginfo('TERMINATE SUBSCRIBERS.');
		if len(self.__subscribers) != 0:
			for subscriber in self.__subscribers:  # Stop listening to topics
				subscriber.unregister()
		self.__experim_topics.end_of_expermiment() # Export the results with the way tha struct_topics class determines

	def get_published_topics(self):
		"""This function returns a list with the current published topics
		"""
		topics = []
		for topic in rospy.get_published_topics():
			topics.append(topic[0])
		return topics
			
	def exper_cycle_reached(self):
		"""Logs the time the experiment cycle reached and inform topics_struct that
		a cycle has been reached.
		"""
		self.__experim_topics.cycle_reached() 
		
	def run_launch_files(files):
		"""This function run the desired launch files.
		
		Args.
			files: a list with the path names of launch files.
		"""
		if len(files) == 0:
			self.terminate('NO LAUNCH FILES')
		
	def are_topics_published(self,wait_time):
		""" This function try to find the desired topics.(check if they are published)
		Between attempts wait for "wait_time".
		"""
		while 1 == 1: 
			topics = self.get_published_topics() # get current published topics
			for topic in self.__experim_topics.get_all_topics().keys():
				if topic not in topics:    # Unable to locate "topic"   so we have to wait
					rospy.loginfo('WAIT FOR TOPIC: "%s" TO BE PUBLISHED', topic)
					break
			else:            # All topics have been found. Break initial loop.
				rospy.loginfo('DESIRED TOPICS HAVE BEEN PUBLISHED')
				break
			rospy.sleep(wait_time)

	def start_experiment(self):
		""" THis function starts the experiment. Initialize ros node, starts the
		subscribers, start the sampler and terminator and at the end calls
		spin() for callbacks execution.
		"""
		rospy.loginfo('START THE SUBSCRIBERS.')
		self.are_topics_published(self.__WAIT_TIME)
		for topic in self.__experim_topics.get_all_topics().keys(): # start the subscribers
			self.__subscribers.append(rospy.Subscriber(topic, hungerMsg, lambda msg,tp=topic: self.__experim_topics.update_values(msg,tp)))
		rospy.loginfo('SUBSCRIBERS STARTED.')
		
		rospy.loginfo('START SAMPLER.')
		self.__sampler = rospy.Timer(rospy.Duration(self.__sampling_time), lambda event: self.exper_cycle_reached() ) # Timer to record the last values of each topic
		
		rospy.loginfo('SPINNING....')
		rospy.sleep(self.__experiment_duration)
		rospy.loginfo('STOP SPINNING')
		
		rospy.loginfo('END OF EXPERIMENT')
		self.terminate()
