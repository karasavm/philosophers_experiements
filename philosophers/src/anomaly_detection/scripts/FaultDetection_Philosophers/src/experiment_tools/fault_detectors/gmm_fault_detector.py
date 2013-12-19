""" This module contains only the GMM implementaion of FaultDetector class.
It uses scikit learn and numpy libraries.
"""
import numpy as np
from sklearn import mixture
from fault_detector import FaultDetector


class GMMFaultDetector(FaultDetector):
    """ This class is the implementation of FaultDetector class for the GMM
    algorithm. It encapsulates the basic functions of GMM from scikit package.
    It provides a function for training a model and another one for predict
    a sample according to the trained model.
    """
    def __init__(self, params):
        """Initializes the basic variables for the object which are the
        algorithms parameters and fault detector object.
        
        Arg:
            params: A dictionary with the appropriate params for a GMM 
            estimator. The dictionary will contain the 
            keys = ['window', 'n_components', 'cutoff_per', 'covariance_type'],
            in case it won't default values given.
            (window=1, cutoff_per=0.9, n_components =5, covariance_type = diag).
        """
        
        # Check for valid parameters
        for key in params.keys():
            if key not in ('window', 'n_components', 'covariance_type',
                           'cutoff_per'):
                raise ValueError('Wrong key value: %s' % key)
         
        # Initialize default values
        if 'window' not in params.keys():
            params['window'] = 1
        if 'cutoff_per' not in params.keys():
            params['cutoff_per'] = 0.9
        if 'n_components' not in params.keys():
            params['n_components'] = 5
        if 'covariance_type' not in params.keys():
            params['covariance_type'] = 'diag'

        # create gmm parameters dictionary
        gmm_params = {}
        for key in params.keys():
            if key not in ('window', 'cutoff_per'):
                gmm_params[key] = params[key]
        
        FaultDetector.__init__(self, params)
        
        self.__cutoff_per = params['cutoff_per']
        self._detector = mixture.GMM(**gmm_params)
        self.__threshold = None  # defined on _fit_classifier()
        
    def _fit_classifier(self, dataset):
        """ This function train our estimator. The dataset has been created
        from the FaultDetector class using the window width.
        We score the train dataset in order to create a probability threshold
        to take decisions.

        Args:
            dataset: its a numpy array of shape(x,y).

        """
        self._detector.fit(dataset)
        
        scores = self._detector.score(dataset)
        scores = np.sort(scores)[::-1]  # descent sorting
        self.__threshold = scores[ int(scores.size*self.__cutoff_per) ]
        
    def _predict_sample(self, sample):    
        """Make the decision for the faultyness of sample.
        
        Args:
            sample: the sample to classify. A numpy array with shape(1,x).
        
        Return:
            1 for non faulty -1 for faulty according to the prediction.
        """
        score = self._detector.score(sample)
        
        if score >= self.__threshold:
            return 1
        else:
            return -1

    def get_detector(self):

        return self._detector
