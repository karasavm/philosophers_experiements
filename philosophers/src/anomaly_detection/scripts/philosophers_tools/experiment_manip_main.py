#!/usr/bin/env python

import experiment_manip
import philosophers_data
import time
import rospy

if __name__ == "__main__":

	print 'EXPERIMENTING...'
	
	NODE_NAME = "experimenter"
	NORMAL = rospy.get_param('/experiment/normal',50)
	FAULTY = rospy.get_param('/experiment/faulty',0)
	PATH = rospy.get_param('/experiment/logs',"/home/mike/")
	
	HTOPICS = philosophers_data.PhilosophersData(NORMAL, FAULTY, PATH, 1)
	
	experiment = experiment_manip.ExperimentManip(NODE_NAME, HTOPICS)
	experiment.start_experiment()

	time.sleep(2)
	print 'EXPERIMENT COMPLETE!!!\n'
