""" This module contains only the GMM implementaion of FaultDetector class.
It uses scikit learn library.
"""
from sklearn import svm
from fault_detector import FaultDetector


class SVMFaultDetector(FaultDetector):
    """ This class is the implementation of FaultDetector class for the SVM
    algorithm. It encapsulates the basic functions of GMM from scikit library.
    It provides a function for training a model and another one for predict
    a sample according to the trained model.
    """
    def __init__(self, params):
        """Initializes the basic variables for the object which are the
        algorithms parameters and fault detector object.

        Arg:
            params: A dictionary with the appropriate params for a GMM
            estimator. The dictionary will contain the
            keys = ['window', 'gamma', 'nu', 'kernel'],
            in case it won't default values given.

        """

        # Check for valid parameters
        for key in params.keys():
            if key not in ('window', 'gamma', 'nu', 'kernel'):
                raise ValueError('Wrong key value: %s' % key)
        
        # Initialize default values
        if 'window' not in params.keys():
            params['window'] = 1
        if 'gamma' not in params.keys():
            params['gamma'] = 0.1
        if 'nu' not in params.keys():
            params['nu'] = 0.1
        if 'kernel' not in params.keys():
            params['kernel'] = 'rbf'
        
        # create svm parameters dictionary
        svm_params = {}
        for key in params.keys():
            if key not in 'window':
                svm_params[key] = params[key]        
        
        FaultDetector.__init__(self, params)
        self._detector = svm.OneClassSVM(**svm_params)
        
    def _fit_classifier(self, dataset):
        """ This function train our estimator. The dataset has been created
        from the FaultDetector class using the window width. It uses fit()
        function form scikit library.

        Args:
            dataset: its a numpy array of shape(x,y).
        """
        self._detector.fit(dataset)
    
    def _predict_sample(self, sample):         
        """Make the decision for the faultyness of sample.
        
        Args:
            sample: the sample to classify. A numpy array with shape(1,x).
        
        Return:
            1 for non faulty -1 for faulty according to the prediction.
        """
        return self._detector.predict(sample)

    def get_detector(self):
        """This function returns the model.
        """
        return self._detector
