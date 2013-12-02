import sys
import subprocess
import os
import time
import thread
import shutil
import datetime
import file_creator
	
def load_params(file):
	subprocess.Popen('rosparam load '+file,shell=True)

def run_experiment(): # block function
	subprocess.call("rosrun anomaly_detection experiment_manip_main.py",shell=True) # blocks until experiment completes

	
def faulty_simulator(args):
	"""THis function simulates a random faulty behaviours.
	"""
	normal = args[0]
	faulty = args[1]
	mode = args[2]
	
	time.sleep(DURATION*0.25)
	subprocess.call("rosparam load "+faulty,shell=True)
	time.sleep(DURATION*0.25)
	subprocess.call("rosparam load "+normal,shell=True)
	time.sleep(DURATION*0.25)
	subprocess.call("rosparam load "+faulty,shell=True)
	time.sleep(DURATION*0.25)
	subprocess.call("rosparam load "+normal,shell=True)
	

def get_train_set():
	
		load_params(SCENARIOS_PATH+"normal.yaml")
		time.sleep(5)  # give time to return in normal mode
		exp_path = EXPERIMENTS_PATH + "exp_train_" + str(datetime.datetime.time(datetime.datetime.now()))+"/"
		os.mkdir(exp_path)
		experiment_params = [
				{"name":"/sampling_time", "value":"0.5"}, 
				{"name":"/duration", "value":str(DURATION)}, 
				{"name":"/logs","value": '"'+exp_path+'"'}, 
				{"name":"/normal","value":str(NORMAL)}, 
				{"name":"/faulty","value": str(FAULTY)}
			]
		shutil.copy(SCENARIOS_PATH+"normal.yaml",exp_path+"normal.yaml")
		file_creator.create_yaml_file(experiment_params, exp_path, 'experiment.yaml', "/experiment/")
		
		load_params(exp_path+'experiment.yaml')
		run_experiment()
		time.sleep(5)
		
def get_test_sets(scenario):

	load_params(SCENARIOS_PATH+"normal.yaml")
	time.sleep(5)  # give time to return in normal mode
	
	exp_path = EXPERIMENTS_PATH + scenario + "_" + str(datetime.datetime.time(datetime.datetime.now()))+"/"	
	os.mkdir(exp_path)

	scenario = scenario + ".yaml"
	experiment_params = [
				{"name":"/sampling_time", "value":"0.5"}, 
				{"name":"/duration", "value":str(DURATION)}, 
				{"name":"/logs","value": '"'+exp_path+'"'}, 
				{"name":"/normal","value":str(NORMAL)}, 
				{"name":"/faulty","value": str(FAULTY)}
			]
	file_creator.create_yaml_file(experiment_params, exp_path, 'experiment.yaml', '/experiment/')
	load_params(exp_path+'experiment.yaml') # creates parameters yaml file and load it in parameter server
	shutil.copy(SCENARIOS_PATH+"normal.yaml",exp_path+"normal.yaml")
	
	if os.path.isfile(SCENARIOS_PATH+scenario) == False:
		print 'UNABLE TO LOCATE "%s"' % scenario
		sys.exit()
	
	args = [SCENARIOS_PATH+"normal.yaml", SCENARIOS_PATH+scenario, 0]
	
	
	shutil.copy(SCENARIOS_PATH+scenario,exp_path+scenario)
	thread.start_new_thread(faulty_simulator,(args,))
	
	subprocess.call("rosrun anomaly_detection experiment_manip_main.py",shell=True) # blocks until experiment completes

	load_params(SCENARIOS_PATH+"normal.yaml")
	time.sleep(10)

if __name__ == "__main__":
	
	
	
	#####################################################################################
	DURATION = 15*60
	NORMAL = 49
	FAULTY = 1
	
	SCENARIOS =["const", "deny_forks", "eating_thinking_rates", "hunger_rates"] 
   
	PARAMS = [
		{"name" : "/max_eating_time", "type" : "int", "value" : "8"},
		{"name" : "/max_thinking_time",	"type" : "int",	"value" : "2"},
		{"name" : "/starvationThreshold", "type" : "double", "value" : "5.0"},
		{"name" : "/hunger_increase_rate", "type" : "double", "value" : "1.0"},
		{"name" : "/hunger_decrease_ratio", "type" : "double", "value" : "0.8"},
		{"name" : "/total_forks", "type" : "int", "value" : "200"},
		{"name" : "/total", "type" : "int", "value" : str(NORMAL + FAULTY)},
		{"name" : "/faulty", "type" : "int", "value" : "0"},
		{"name" : "/deny_forks", "type" : "int", "value" : "-1"}
	]
	
	LAUNCH_PATH = '/home/mike/svn/nasia/trunk/philosophers/src/dining_philosopher/launch/'
	EXPERIMENTS_PATH = '/home/mike/experiments/'
	SCENARIOS_PATH = '/home/mike/experiments/scenarios/'
	#####################################################################################
	
	
	#file_creator.create_parent_launch( LAUNCH_PATH, NORMAL, FAULTY, name="main.launch", forks=5, params_name="params.launch")
	#file_creator.create_params_launch( PARAMS, LAUNCH_PATH, name='params.launch', namespace='/philosophers/')
	#file_creator.file_creator.create_yaml_file(PARAMS, SCENARIOS_PATH, "normal.yaml", "/faulty_philosophers/")
	
	#get_train_set()
	
	for scenario in SCENARIOS:
		get_test_sets(scenario)
		
	
	
	
