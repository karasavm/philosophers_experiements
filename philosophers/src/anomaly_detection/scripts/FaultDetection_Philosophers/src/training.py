#!/usr/bin/env ipython

from experiment_tools.analyzer import Analyzer
from experiment_tools.fault_detectors.svm_fault_detector import SVMFaultDetector
from experiment_tools.fault_detectors.gmm_fault_detector import GMMFaultDetector
if __name__ == "__main__":

    svm_params = {
        "gamma": [0.01,  0.1],
        "nu": [0.01, 0.05, 0.09],
        'window': [1, 10],
        'kernel': ['rbf']
    }
    
    gmm_params = {
        "n_components": [10],
        "covariance_type": ["diag"], 
        'window': [5],
        'cutoff_per': [0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95]
    }
    
    

    #########################
    ws_path = '/home/mike/Workspace/'
    gname = 'gmm0'
    trainset_name = 'trainset1'
    testsets_gname = "testsets1"
    ##########################




    svm_params = {
        "gamma": [0.01, 0.1, 1, 2, 3, 4, 5, 10, 12, 15, 20, 30, 50],
        "nu": [0.01, 0.05, 0.09, 0.1, 0.15, 0.2, 0.4, 0.8, 0.9, 0.95, 1],
        'window': [1, 2, 3, 4, 5, 8, 10, 15, 20],
        'kernel': ['rbf']
    }

    gmm_params = {
        "n_components": [1, 5, 10, 15, 20],
        "covariance_type": ["diag", "full"],
        'window': [1, 2, 3, 4, 5, 8, 10, 15, 20],
        'cutoff_per': [0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95]
    }

    # Analyzer.create_models(
    #     ws_path,  gname,  SVMFaultDetector,  trainset_name,  svm_params)
    analyzer = Analyzer(ws_path,  gname)
    # analyzer.evaluate_on_testsets(testsets_gname)
    analyzer.find_best_metrics(testsets_gname,  10)
    # analyzer.construct_rocs(gmm_params, 'testsets1',output=False, show=True)