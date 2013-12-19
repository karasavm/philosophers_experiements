#!/usr/bin/env python

from experiment_tools.fault_detectors.svm_fault_detector import SVMFaultDetector
from experiment_tools.fault_detectors.gmm_fault_detector import GMMFaultDetector

from experiment_tools.evaluator import Evaluator
import numpy as np
from experiment_tools.fault_detectors.gmm_fault_detector import GMMFaultDetector
import pylab as pl
from mylibrary import *


def plot_hungers(file_names, phil_names):


    size = len(phil_names)
    duration = np.array(range(size))*0.5

    pl.subplots_adjust(hspace=0.25, top=0.95)

    for i, pname in enumerate(phil_names):

        # load hungers
        testset = np.loadtxt(open(file_names[i]+'results_set.csv'))


        duration = np.array(range(testset.shape[0]))*0.5
        pl.subplot(size,1,i+1)
        pl.title(pname)
        pl.ylabel('Hunger Level')
        pl.plot(duration, testset)

    pl.xlabel('Time in secs. (duration=30 mins)')
    pl.show()



if __name__ == "__main__":



    # test_paths = []
    # test_paths.append('/home/mike/Workspace/TEST_SETS/testsets1/hunger_rates_a/')
    # test_paths.append('/home/mike/Workspace/TEST_SETS/testsets1/hunger_rates_c/')
    # test_paths.append('/home/mike/Workspace/TEST_SETS/testsets1/hunger_rates_b/')
    #
    # phil_names = []
    # phil_names.append('High Increase Rate(3) Philosopher')
    # phil_names.append('High Increase Rate(1.5) Philosopher')
    # phil_names.append('High Decrease Ratio(0.1) Philosopher')
    #
    # plot_hungers(test_paths, phil_names)
    #
    #
    #
    # test_paths = []
    # test_paths.append('/home/mike/Workspace/TEST_SETS/'
    #                   'testsets1/eating_thinking_rates/')
    # test_paths.append('/home/mike/Workspace/TEST_SETS/'
    #                   'testsets1/eating_thinking_rates_b/')
    # test_paths.append('/home/mike/Workspace/TEST_SETS/testsets1/const/')
    #
    #
    #
    #
    # phil_names = []
    # phil_names.append('Think a lot Eat a bit Philosopher')
    # phil_names.append('Eat Think the Same Philosopher')
    # phil_names.append('Constant Philosopher')
    #
    # plot_hungers(test_paths, phil_names)

    ws_path = '/home/mike/Workspace/'

    train_path = '/home/mike/Workspace/TRAIN_SETS/trainset1/'

    trainset = np.loadtxt(open(train_path+'results_set.csv','r')).reshape((-1,1))

    test_path = '/home/mike/Workspace/TEST_SETS/' \
                'testsets1/hunger_rates_a/'

    testset = np.loadtxt(open(test_path+'results_set.csv', 'r')).reshape((-1,1))
    behset = np.loadtxt(open(test_path+'behaviours_set.csv', 'r')).reshape((-1,1))




    gmm_params = {"n_components": 1, "cutoff_per": 0.5, 'window': 2, 'covariance_type': 'diag'}



    detector = GMMFaultDetector(gmm_params)
    print "train"
    detector.train_classifier(trainset)
    print "test"
    k = detector.classify_samples(testset)


    # duration = np.array(range(testset.shape[0]))*0.5
    #
    # pl.plot(duration, testset)
    # pl.plot(duration, trainset[:testset.size,:])
    # for i, test in enumerate(testset):
    #
    #     if behset[i] == 1 and k[i] == 1:
    #
    #         pl.scatter(duration[i],testset[i],c='r')
    #
    #     if behset[i] == 0 and k[i] == -1:
    #
    #         pl.scatter(duration[i],testset[i],c='g')
    #
    # pl.show()
    # print k[k==-1].size/float(k.size)
    #



