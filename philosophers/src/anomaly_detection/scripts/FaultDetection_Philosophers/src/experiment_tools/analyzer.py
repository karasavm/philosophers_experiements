"""
This module contains the Analyzer class. It a experiment manipulator.
Train an algorithm with a combination of parmaeters, evaluate testsets
according to the trained models. Exports Roc curves and metrics.
"""
import numpy as np
import os
import itertools
import ast
import csv
from collections import OrderedDict
import glob
import pylab as pl
from evaluator import Evaluator
from roc import ROC
from fault_detectors.fault_detector import FaultDetector


BEHAVIOURSSET_FNAME = 'behaviours_set.csv'
DATASET_FNAME = 'results_set.csv'
PARAMS_COMB_FNAME = "_params_comb.txt"
GROUP_PARAMS_FNAME = ".txt"
EVALUATIONS_DIRNAME = 'evaluations'
EVALUATIONS_FNAME = '_evaluations.txt'
TRAINED_MODELS_DIRNAME = 'TRAINED_MODELS'
TEST_SETS_DIRNAME = 'TEST_SETS'
RESULTS_DIRNAME = 'RESULTS'
TRAIN_SETS_DIRNAME = 'TRAIN_SETS'


class Analyzer:
    """
    This class is associated with a group o trained models. Each group's
    models are from the same algorithm class e.g. SVMFaultDetector buth
    with different parameters. All models of group are trained with the
    same trainset. With this class you have the ability to to train the models
    and create the group of trained models, to classify the samples of different
    test sets and evaluate the results with "fpr" and "detection rate". Find
    the best combinations of algorithms parameters that gave the best evaluation
    results on the desired testsets. Finally you can plot roc curves.
    All experimets are took place on a workspace directory. Inside the diractory
    there(MUST) are a TRAINED_MODELS  dir for the groups of trained models, a
    TEST_SETS dir that contains the group of testsets, a RESULTS dir that
    contain the results for each group of testset..
    """
    def __init__(self, ws_path, gname):
        """
        Args:
            ws_path: the work space directory full path
            gname: the group name of trained models.
        """
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
            
        params_file = open(fname, 'r')
        line = params_file.readline()
        self.__params = ast.literal_eval(line)  # convert string to dictionary
        
        # check if grid_params text file exists
        fname = os.path.join(self.__gpath, (self.__gname+PARAMS_COMB_FNAME)) 
        if not os.path.exists(fname):
            raise IOError("No such file: '%s'" % fname)
            
        # load grid_params (parameterms combinations)
        self.__grid_params = self.__load_grid_params()
        self.__group_size = len(self.__grid_params)
    
    def find_best_metrics(self, testsets_gname, number):
        """
        For a given group of testset this function finds the desired number
        of the best parameters combination among the algorithms of a group of
        trained models. Find the best parametes for each model group seperatly.
        Exports the results to
        RESULTS/{testset_gname}/{trained models group name}.
        Args:
            testset_gname: The full path of test set group
            number: The number o best parameters combination.

        """
        results_gpath = os.path.join(
            self.__ws_path, RESULTS_DIRNAME, 
            testsets_gname, 
            self.__gname
        )
            
        # Checks for proper input
        if not os.path.exists(results_gpath):
            raise IOError("No such directory: '%s'" % results_gpath)
            
        for fpath in glob.glob(os.path.join(results_gpath,
                                            ("*"+self.__gname+"*.txt"))):
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
            
            # best_file = os.path.join(results_gpath, fname)
            print fpath
            for res in results:
                print res
            print "\n"

            # export results to csv file
            # Analyzer.__create_csv(best_file, results)
            
    def construct_rocs(self,
                       const_params, testsets_gname, show=False, output=True):
        """
        Constructs the roc curves according to a specific variable parameter
        and keep const all the others.

        Args:
            const_params: A dict with the desired values of constant parameters
            testsets_gname: The name o testsets_group.
            show: if true shows the rocs plot.
            output: If true export the results to file.  To the same directory
            with the evaluation files.
            RESULTS/{testset_gname}/{trained models groups name}.
        """
        # set working directory
        results_path = os.path.join( 
            self.__ws_path, RESULTS_DIRNAME, testsets_gname, self.__gname)
        
        # check for working's directoy existance
        if not os.path.exists(results_path):
            raise IOError("No such directory: '%s'" % results_path)
        
        # check the numbers of constant params
        if len(const_params) != len(self.__params) - 1:
            raise ValueError(
                'Wrong number of '
                'constant parameters.Current models '
                'parameters are: %s' % str(self.__params.keys()))
        
        # check the validity of constant parameter's keys. 
        des_param = []  # its the parameter in which we plot the roc
        for key in self.__params.keys():
            if key not in const_params.keys():
                des_param.append(key)
               
        # check the validity of parameter's names
        if len(des_param) != 1:
            raise ValueError(
                'Wrong name(s) of constant parameter(s). '
                'Current models parameters are: %s' % str(self.__params.keys()))

        # check the validity of parameter's values
        for key in const_params.keys():
            if const_params[key] not in (self.__params[key]):
                raise ValueError(
                    "Wrong '%s' parameter value -> '%s'.Available values: %s"
                    % (key, str(const_params[key]), str(self.__params[key])))
        
        # load evaluation files names
        fname = results_path + "/*.*"

        # all files that not contain the word BEST
        # ITS FILE CORRESPONDS TO A DIFFERENT TEST SET
        eval_files = [f for f in glob.glob(fname) if 'BEST' not in f]

        # create the roc for its file
        roc_list = []
        for fname in eval_files:
            par, met = self.__load_eval_file(fname)
            
            var_param = dict()
            var_param[des_param[0]] = []
            metrics = []
            for ind in Analyzer.__extract_params_id(par,
                                                                 const_params):

                var_param[des_param[0]].append(par[ind][des_param[0]])
                metrics.append(met[ind])
            
            roc = ROC(metrics, var_param, const_params)
            roc.create_roc(fname)
            roc_list.append(roc)

        if output:
            for roc, fname in zip(roc_list, eval_files):
                roc.export_roc(fname+'.png')

        if show:
            ROC.show_rocs()

    @staticmethod    
    def __extract_params_id(params, const_params):
        """
        Finds a specific combination of parameters inside a list and returns
        the id insede the list. Its a generator function.

        Args:
            params: A lsit with e combinations of parameters.
            const_params: the desired combination of parameters to search for.

        Returns the id of desired combination inside the list.
        """
        keys = const_params.keys()
        match = 1
        for i, par in enumerate(params):
            for key in keys:
                match = 1
                if const_params[key] != par[key]:
                    match = 0
                    break
            if match:
                yield i

    @staticmethod
    def __load_eval_file(eval_file):
        """This function loads the an evaluation file. The file must follows
        the pattern {id}#{dictionary with params}{dictionary with metrics}.

        Args:
            eval_file: is the FULL path of file. In case the file not exists
            the function Raises the corresponding Exception.

        Returns:
            A tuple with two lists. The first is a list with dictionaries
            containing the params and the second is as list with dictionaries
            containing the metrics.

        """
        if not os.path.exists(eval_file):
            raise IOError("No such file: '%s'" % eval_file)
        
        # load parameters and metrics from evaluation files
        eavl_file = open(eval_file, 'r')
        metrics = []
        params = []
        for line in eavl_file:
            key, comb = tuple(line.split("#"))
            par, met = tuple(ast.literal_eval(comb))
            metrics.append(met)
            params.append(par)

        return params, metrics

    @staticmethod        
    def __create_csv(fname, results):
        """
        Creates a csv file according to a dictionary. The columns of the
        csv are the dictionaries keys.

        Args:
            fname: the full name of csv file to create
            results: A list with dictionaries.
        """

        csvf = open(fname, 'wb')
        
        keys = results[0].keys()
        dict_writer = csv.DictWriter(csvf, keys)
        dict_writer.writer.writerow(keys)
        dict_writer.writerows(results)
            
    def evaluate_on_testsets(self, testsets_gname):
        """
        This function evaluates all the testsets of a testset group.
        The group must loacated on workspace/TEST_SETS/{testsets group name}.
        and the results are exported to
        /RESULTS/{testsets_groupname}/*{trianed models group name}
        on file with name {testsetname}_{gname}_evaluations.txt. The
        evaluations on file are exported with the pattern
        {params comb id}#
            [{dictionary with params combinations},{dictionary with metrics}]
        """
        testsets_gpath = os.path.join(self.__ws_path,
                                      TEST_SETS_DIRNAME, testsets_gname)
        
        # Checks for proper input
        if not os.path.exists(testsets_gpath):
            raise IOError("No such file: '%s'" % testsets_gpath)

        for testset_id, testset_dirname in enumerate(
                os.listdir(testsets_gpath)):
            
            path = os.path.join(
                self.__ws_path,
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
                                    RESULTS_DIRNAME,
                                    testsets_gname, self.__gname)
                
            # create evaluations directory if not exists
            Analyzer.__create_dir(res_path) 
            
            # create text file with grid_params and results 
            # have to open grid params and copy to new file the combinations
            fname = os.path.join(
                res_path, (testset_dirname+"_"+self.__gname+EVALUATIONS_FNAME))
            gparams_file = open(fname, 'w')
            
            # evaluate group on testset and Simultaneously write results to file
            for comb, metric in enumerate(
                    self.__evaluate_group(testset, behset)):
                
                print "GROUP: %s ---- EVALUATE: %d of %d MODELS. " \
                      "TESTSET %d of %d." \
                      % (self.__gname, comb+1, self.__group_size,
                         testset_id+1, len(os.listdir(testsets_gpath)))
                
                line = str([self.__grid_params[comb], metric])
                
                gparams_file.write(str(comb)+'#'+line+"\n")
            gparams_file.close()

    @staticmethod
    def __calc_best_metrics(metrics, num):
        """
        The best metrics are closed to the point (0,1) on diagram
        (fpr,detection_rate). This function compute the distance for each pair
        (fpr,detection_rate) from the above point.

        Args:
            metrics: A list with dictionaries. Its dictionary contains
            the pair (fpr,detection_rate).
            num: The number of metrics to return. From the greatest to the
            least.

        Returns:
            The indices that point to "num' best metrics on the list metrics
            from input.
        """
        #  some checks
        if num == 0:
            num = 1
        if num > len(metrics):
            num = len(metrics)
        
        dists = np.empty((0, 1))
        for met in metrics:
            fpr = met['fpr']
            drate = met['detection_rate']
            dists = np.append(dists,
                              np.round(
                                  np.power(
                                      (fpr*fpr + (1-drate)*(1-drate)), 0.5), 3))
            
        ind = np.argsort(dists)

        return ind[0:num+1], dists[ind[0:num+1]]
        
    def __evaluate_group(self, testset, behset):
        """
        This function is responsible for testing the models of this group
        according to a test set and a behaviour set. Its a generator function.

        Args:
            testset: A numpy array of shape(x,y). This is the test set.
            behset: A numpy array of shape(x,1). This is the behaviour set.

        Return:
            In each iteration returns a dictionary with metrics.
        """
        for comb, params in enumerate(self.__grid_params):
            window = params['window']

            model_path = os.path.join(self.__gpath, ("w"+str(window)))
            
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
        """
        This function loads the file that contains all parameter
        combinations for that group. The file must be on
        /{workspace}/{trainedmodels}/{gname}/ with name
        {gname}_params__comb.txt .

        Retruns:
            A list with dictionaries. Each dictionary contains a parameters
            combination.
        """
        # open file and load params
        # grid params file name
        fname = os.path.join(self.__gpath, (self.__gname+PARAMS_COMB_FNAME)) 
        gparams_f = open(fname, 'r')
        
        grid_params = []
        for line in gparams_f:
            key, comb = tuple(line.split("#"))
            grid_params.append(ast.literal_eval(comb))
             
        return grid_params
        
    @staticmethod    
    def create_models(ws_path, gname, FaultDetector, trainset_name, params):
        """
        This static function creates a group of trained models. The models
        are saved inside directory
        /{workspace}/{trainedmodels}/{gname}/w{window}/
        with name {group_name}w{window}c{combination}.pkl.

        Args:
            ws_path: Work space directory.
            gname: The group name of trained models.
            FaultDetector: THe FaultDetector class type. Its a type not an
            object.
            trainset_name: The trainset name. Is a directory name that is inside
            /{workspace}/{trainsets}/.
            params: A dictionary with the parameters. Its key points to a list.
        """
        trained_models_path = os.path.join(ws_path, TRAINED_MODELS_DIRNAME)
        
        # set default windows in case not defined
        if 'window' not in params.keys():
            params['window'] = [1, 5, 10]
        
        # load trainset
        trainset_path = os.path.join(ws_path,
                                     TRAIN_SETS_DIRNAME,
                                     trainset_name, DATASET_FNAME)

        trainset = Analyzer.__load_dataset(trainset_path)

        # grid list with all the combination of desired params for the estimator
        grid_params = Analyzer.__create_grid_params(params)

        # total num of experiments
        exp_num = len(grid_params)
        
        # create description for the group
        name = gname + ".txt"
        desc_file = open(os.path.join(trained_models_path, name), 'w')
        desc_file.write(str(params)+"\n")
        desc_file.close()

        # create the directory to put the trained models
        gpath = os.path.join(trained_models_path, gname)
        if not Analyzer.__create_dir(gpath):
            raise IOError('The group already exists: "%s"' % gname)
        
        # export parameter combination file
        fname = os.path.join(gpath, (gname+PARAMS_COMB_FNAME))
        comb_file = open(fname, 'w')
        for i, par in enumerate(grid_params):
            comb_file.write(str(i)+"#"+str(par)+"\n")
        comb_file.close()
        
        # create window directories
        for window in params['window']:
            dname = os.path.join(gpath, ("w"+str(window)))
            Analyzer.__create_dir(dname)
        
        train_id = 1
        for i, comb in enumerate(grid_params):
            
            window = comb['window']
            model_name = gname+"w"+str(window)+"c"+str(i)+".pkl"
            
            print "GROUP: %s ---- TRAINING %d of %d MODELS.   window=%d" % (
                gname, train_id, exp_num, window)
            detector = FaultDetector(comb)




            detector.train_classifier(trainset)

            d = os.path.join(gpath, ("w"+str(window)))
            detector.export_model(os.path.join(d, model_name))
            
            train_id += 1
        
        del trainset  # just to be sure

    @staticmethod
    def __load_dataset(fname):
        """
        This function load a csv file from hard disc as a numpy array.
        It uses the numpy.loadtxt() function.

        Args:
            The full path of file.

        Returns:
             A numpy array of shape(x,y).
        """

        dataset = np.loadtxt(open(fname))
        if len(dataset.shape) == 1:    
            return dataset.reshape((dataset.shape[0], -1))
        
        return dataset
                
    @staticmethod    
    def __create_grid_params(params):
        """
        This function creates all possible parameter combinations. Creates a
        grid of parameters.

        Args:
            params: A dictionary with the parameters. Its key points to a list.

        Returns:
            A list with dictionaries. Its dictionary is a unique combination of
            parameters.
        """
        keys = params.keys()
        tlist = []
        for key in keys:
            tlist.append(params[key])
        
        grid = []
        for param in itertools.product(*tlist):
            grid.append({key: param[i] for i, key in enumerate(keys)})
        
        return grid
        
    @staticmethod
    def __create_dir(path):
        """
        This function create a directory in case it does not exist.

        Args:
            The full path directory
        """
        if not os.path.exists(path):
            os.makedirs(path)
            return True
        return False