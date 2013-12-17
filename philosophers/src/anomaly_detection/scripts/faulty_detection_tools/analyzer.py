import numpy as np
import os
import itertools
import ast
from evaluator import Evaluator
from roc import ROC
from fault_detector import FaultDetector
import csv
from collections import OrderedDict
import glob
import pylab as pl

BEHAVIOURSSET_FNAME = 'behaviours_set.csv'
DATASET_FNAME = 'results_set.csv'
PARAMS_COMB_FNAME = "_params_comb.txt"
GROUP_PARAMS_FNAME = ".txt"
EVALUATIONS_DIRNAME = 'evaluations'
EVALUATIONS_FNAME = '_evaluations.txt'
TRAINED_MODELS_DIRNAME = 'TRAINED_MODELS'
TEST_SETS_DIRNAME = 'TEST_SETS'
RESULTS_DIRNAME = 'RESULTS'
TRAIN_SETS_DIRNAME ='TRAIN_SETS'


class Analyzer:

    def __init__(self, ws_path, gname):
        
        self.__ws_path = ws_path
        self.__gname = gname
        self.__rpath = os.path.join(ws_path, RESULTS_DIRNAME)
        
        # check if group directory exists
        self.__gpath = os.path.join(ws_path, TRAINED_MODELS_DIRNAME, gname)
        if not os.path.exists(self.__gpath):
            raise IOError("No such group directory: '%s'" % self.__gpath)
                    
        # load group's parameters
        fname = os.path.join(
            ws_path, 
            TRAINED_MODELS_DIRNAME, 
            (gname+GROUP_PARAMS_FNAME)
        )
        
        if not os.path.exists(fname):
            raise IOError("No such file: '%s'" % fname)
            
        f = open(fname, 'r')
        line = f.readline()
        self.__params = ast.literal_eval(line) # convert string to dictionary
        
        # check if grid_params text file exists
        fname = os.path.join(self.__gpath, (self.__gname+PARAMS_COMB_FNAME)) 
        if not os.path.exists(fname):
            raise IOError("No such file: '%s'" % fname)
            
        # load grid_params (parameterms combinations)
        self.__grid_params = self.__load_grid_params()
        self.__group_size = len(self.__grid_params)
    
    def find_best_metrics(self, testsets_gname, number):
            
        results_gpath = os.path.join(
            self.__ws_path, RESULTS_DIRNAME, 
            testsets_gname, 
            self.__gname
        )
            
        # Checks for proper input
        if not os.path.exists(results_gpath):
            raise IOError("No such directory: '%s'"%results_gpath)
            
        for fpath in glob.glob(
            os.path.join(results_gpath, ("*"+self.__gname+"*.txt"))):
                
            # load parameters and metrics from evaluation files
            params, metrics = self.__load_eval_file(fpath)
                
            # calc best metrics
            best_metrics, dists = self.__calc_best_metrics(metrics, number)
            
            # construct results
            results = []
            for i, metric_id in enumerate(best_metrics):
                    
                temp = OrderedDict(params[metric_id].copy())
                temp.update(metrics[metric_id])
                temp['dist'] = dists[i]
                temp['id'] = metric_id
                results.append(temp)
                
            # prepare for saving the results
            fname = "BEST_#"+str(number)+"#_"
            fname += os.path.basename(fpath).split('.')[0]+".csv"
            
            best_file = os.path.join(results_gpath, fname)
            
            # export results to csv file
            Analyzer.__create_csv(best_file, results)
            
    def construct_ROCs(self, const_params, testsets_gname):
        
        # set working directory
        results_path = os.path.join( 
            self.__ws_path, RESULTS_DIRNAME, testsets_gname, self.__gname)
        
        # check for working's directoy existance
        if not os.path.exists(results_path):
            raise IOError("No such directory: '%s'" % results_path)
        
        # check the numbers of constant params
        if len(const_params) != len(self.__params) -1 :
            raise ValueError('Wrong number of constant parameters.'+
                'Current models parameters are: %s' % str(self.__params.keys()))
        
        # check the validity of constant parameter's keys. 
        des_param = []
        for key in self.__params.keys():
            if key not in const_params.keys():
                des_param.append(key)
               
        # check the validity of parameter's names
        if len(des_param) != 1:
            raise ValueError('Wrong name(s) of constant parameter(s).'+
                'Current models parameters are: %s' % str(self.__params.keys()))
        
        # check the validity of parameter's values
        for key in const_params.keys():
            if const_params[key] not in (self.__params[key]):
                raise ValueError("Wrong '%s' parameter value -> '%s'."+
                    "Available values: %s" 
                    % (key,str(const_params[key]), str(self.__params[key])))
        
        # load evaluation file names
        fname = results_path + "/*.*"
        eval_files = [f for f in glob.glob(fname) if 'BEST' not in f]
        
        
        for fname in eval_files:
            par, met = self.__load_eval_file(fname)
            
            var_param = {}
            var_param[des_param[0]] = []
            metrics = []
            for ind in Analyzer.__extract_params_id_with_pattern(par, 
                const_params):
                
                var_param[des_param[0]].append( par[ind][des_param[0]] )
                metrics.append(met[ind])
            
            roc = ROC(metrics, var_param, const_params)
            roc.create_roc()
            
        pl.show()
        
    @staticmethod    
    def __extract_params_id_with_pattern(params, const_params):
        
        keys = const_params.keys()

        for i,p in enumerate(params):
            for key in keys:
                match = 1
                if const_params[key] != p[key]:
                    match =0
                    break
            if match:
                yield i
            
    def __load_eval_file(self, eval_file):
        
        
        if not os.path.exists(eval_file):
            raise IOError("No such file: '%s'" % eval_file)
        
        # load parameters and metrics from evaluation files
        f = open(eval_file, 'r')
        metrics = []
        params = []
        for line in f:
            key, comb = tuple(line.split("#"))
            par, met = tuple(ast.literal_eval(comb))
            metrics.append(met)
            params.append(par)
            
        return params, metrics
            
            
    @staticmethod        
    def __create_csv(fname, results):

        f = open(fname, 'wb')
        
        keys = results[0].keys()
        dict_writer = csv.DictWriter(f, keys)
        dict_writer.writer.writerow(keys)
        dict_writer.writerows(results)
            
    def evaluate_on_testsets(self, testsets_gname):
        
        testsets_gpath = os.path.join(self.__ws_path, 
            TEST_SETS_DIRNAME, testsets_gname)
        
        # Checks for proper input
        if not os.path.exists(testsets_gpath):
            raise IOError("No such file: '%s'"%testsets_gpath)
        
       
        
        for testset_id,testset_dirname in enumerate(os.listdir(testsets_gpath)):
            
            path = os.path.join(self.__ws_path, 
                TEST_SETS_DIRNAME, testsets_gname, testset_dirname)
            
            # load test set
            testset_path = os.path.join(path, DATASET_FNAME)
            if not os.path.exists(testset_path):
                raise IOError("No such file: '%s'" % testset_path)
            testset = Analyzer.__load_dataset(testset_path)
            
            # load behaviours set
            behset_path = os.path.join(path, BEHAVIOURSSET_FNAME)
            if not os.path.exists(behset_path):
                raise IOError("No such file: '%s'" % behset_path)
            behset = Analyzer.__load_dataset(behset_path)
            
            # prepare for saving the results
            res_path = os.path.join(self.__ws_path, 
                RESULTS_DIRNAME, testsets_gname, self.__gname)
                
            # create evaluations directory if not exists
            Analyzer.__create_dir(res_path) 
            
            # create text file with grid_params and results 
            # have to open grid params and copy to new file the combinations
            fname = os.path.join(res_path,
                (testset_dirname+"_"+self.__gname+EVALUATIONS_FNAME))
            f= open(fname, 'w')
            
            # evaluate group on testset and Simultaneously write results to file
            print behset.shape
            for comb,metric in enumerate(
                self.__evaluate_group(testset, behset)):
                
                print "EVALUATE: %d of %d MODELS.  TESTSET %d of %d."%(
                    comb+1,self.__group_size, testset_id+1,
                    len(os.listdir(testsets_gpath)))
                
                line = str( [self.__grid_params[comb], metric] )
                
                f.write(str(comb)+'#'+line+"\n")
            f.close()
       
            
    def __calc_best_metrics(self, metrics, num):
        
        #  some checks
        if num == 0:
            return
        if num > len(metrics):
            num = len(metrics)
        
        dists = np.empty((0,1))
        for met in metrics:
            fpr = met['fpr']
            dr = met['detection_rate']
            dists = np.append(dists, 
                np.round(np.power((fpr*fpr + (1-dr)*(1-dr)),0.5),3) )
            
        ind = np.argsort(dists)
        
        
        return (ind[0:num], dists[ind[0:num]])
        
    def __evaluate_group(self, testset, behset, testset_id = ''):
        

        for comb,params in enumerate(self.__grid_params):
            window = params['window']
                
            
            model_path = os.path.join(self.__gpath, ("w"+str(window)) )
            
            model_name = self.__gname+"w"+str(window)+"c"+str(comb)+".pkl"
            
            model = os.path.join(model_path, model_name)
            
            if not os.path.exists(model):
                raise IOError("No such file: '%s'" % model)

            # load detector with full name "model"
            # create an Evaluator instance with with the loaded detector
            evaluator = Evaluator(FaultDetector.load_model(model))
            
            # predict testset's samples inside Evaluator object 
            # and evaluate the detector
            yield evaluator.get_metrics(testset, behset)
        
        

    

    def __load_grid_params(self):
        
        # open file and load params
        # grid params file name
        fname = os.path.join(self.__gpath, (self.__gname+PARAMS_COMB_FNAME)) 
        f = open(fname, 'r')
        
        grid_params = []
        for line in f:
            key, comb = tuple(line.split("#"))
            grid_params.append(ast.literal_eval(comb))
             
        return grid_params
        
    @staticmethod    
    def create_models(ws_path, gname, FaultDetector, trainset_name, params):
        
        trained_models_path = os.path.join(ws_path, TRAINED_MODELS_DIRNAME)
        
        # set default windows in case not defined
        if 'window' not in params.keys():
            params['window'] = [1, 5, 10]
        
        # load trainset
        trainset_path = os.path.join(ws_path, 
            TRAIN_SETS_DIRNAME, trainset_name, DATASET_FNAME)
        trainset = Analyzer.__load_dataset(trainset_path)

        # grid list with all the combination of desired params for the estimator
        grid_params = Analyzer.__create_grid_params(params)
        
        
        # total num of experiments
        exp_num = len(grid_params)
        
        # create description for the group
        name = gname + ".txt"
        f = open(os.path.join(trained_models_path, name), 'w')
        f.write(str(params)+"\n")
        f.close()

        # create the directory to put the trained models
        gpath = os.path.join(trained_models_path, gname)
        if not Analyzer.__create_dir(gpath):
            raise IOError('The group already exists: "%s"'%gname)
        
        # export parameter combination file
        fname = os.path.join(gpath,(gname+PARAMS_COMB_FNAME))
        f = open(fname,'w')
        for i,p in enumerate(grid_params):
            f.write(str(i)+"#"+str(p)+"\n")
        f.close()
        
        # create window directories
        for window in params['window']:
            dname = os.path.join(gpath,("w"+str(window)))
            Analyzer.__create_dir(dname)
        
        
        train_id = 1
        for i,comb in enumerate(grid_params):
            
            window = comb['window']
            model_name = gname+"w"+str(window)+"c"+str(i)+".pkl"
            
            print "TRAINING %d of %d MODELS.   window=%d"%(
                train_id, exp_num, window)
            detector = FaultDetector(comb)
            detector.train_classifier(trainset)
            d = os.path.join(gpath, ("w"+str(window)))
            detector.export_model(os.path.join(d, model_name))
            
            train_id += 1
        
        del trainset # just to be sure
    @staticmethod
    
    def __load_dataset(fname):
		
        dataset = np.loadtxt(open(fname))
        if len(dataset.shape) == 1:    
            return dataset.reshape((dataset.shape[0], -1))
        
        return dataset
                
    @staticmethod    
    def __create_grid_params(params):
            
        keys = params.keys()
        tlist = []
        for key in keys:
            tlist.append(params[key])
        
        grid = []
        for param in itertools.product(*tlist):
            grid.append({key:param[i] for i, key in enumerate(keys)})
        
        return grid
        
    @staticmethod
    def __create_dir(path):
        if not os.path.exists(path):
            os.makedirs(path)
            return True
        return False
