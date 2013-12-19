""" This module contains only the abstract FaultDetector class.
It uses scikit learn library and numpy libraries.S
"""
import numpy as np
import pickle
import os.path


class FaultDetector:
    """This function "encapsulates" the basic functionality of a fault detector.
    Provides functions for window constructing, training and classifying.
    """
    def __init__(self, params):
        """Initializes the abstract FaultDetector object.
        Args:
            params: contains all the params for the detector
            (algorithm params(e.g.n_components)+window size+
            everything else e.g.(cutoff_per)
        """

        # initialize variables
        self.__params = params
        self.__window_size = params['window']
        self.__test_window_size = 0     
        self.__trained = 0
        self.__window_stack = None
    def train_classifier(self, data):
        """This function train our model. It uses the implementation of
        abstract function _fit_classifier().

        Args:
            data: the initial dataset before the windows construction
            type of numpy array of shape(x,y).
        """
        self.__trained = 1
        dataset = self._construct_windows(data)
        self._fit_classifier(dataset) 
        
    def classify_sample(self, sample):
        """Is classify the sample using the implementation of abstract function
        _predict_sample(). This function is responsible for constructing the
        windows to dataset.
        
        Args:
            sample: The sample we want to classify,a feature vector.
            Type of numpy array of shape(1,num).
        
        Returns:
             1: For a non faulty value.
            -1: For a faulty value
            None: Until it receives all the (window_size -1) samples.
        """

        if len(sample.shape) != 2:
            raise ValueError('Invalid sample. Sample must be a numpy array'
                             'of shape(1,num)')

        row, features = sample.shape
        if row != 1:
            raise ValueError('Invalid sample. Sample must be a numpy array'
                             'of shape(1,num)')

        if self.__trained != 1:
            raise ValueError("MODEL HAS NOT BEEN TRAINED YET!")

        if self.__window_size == 1:
            return self._predict_sample(sample)
        else:

            if self.__test_window_size == self.__window_size - 1:
                # we have complete the window
                self.__window_stack = np.vstack((self.__window_stack, sample))

                row = self._construct_windows(self.__window_stack)
                prediction = self._predict_sample(row)
                # delete oldest sample
                self.__window_stack = self.__window_stack[1:, :]
                return prediction
            else:
                if self.__test_window_size == 0:

                    self.__window_stack = sample
                    self.__test_window_size += 1
                    return None
                else:
                    self.__window_stack = np.vstack(
                        (self.__window_stack, sample))
                    self.__test_window_size += 1
                    return None

    def score_sample(self, sample):

        """Is classify the sample using the implementation of abstract function
        _predict_sample()
        
        Args:
            sample: The sample we want to classify,a feature vector.
            (type of numpy array)
        
        Returns:
            1: For a non faulty value.
            -1: For a faulty value
            None: Until it receives all the (window_size -1) samples.
        """
        
        row, features = sample.shape
        if row != 1:
            raise ValueError("Wrong number of samples!!")
        
        if self.__trained != 1:
            raise ValueError("MODEL HAS NOT BEEN TRAINED YET!")


        if self.__window_size == 1:
            return self._predict_sample(sample)
        else:
            if self.__test_window_size == self.__window_size - 1:
                # we have complete the window
                self.__window_stack = np.vstack((self.__window_stack, sample))
                
                row = self._construct_windows(self.__window_stack)
                prediction = self._predict_sample(row)
                # delete oldest sample
                self.__window_stack = self.__window_stack[1:, :]
                return prediction
            else:
                if self.__test_window_size == 0:
                    
                    self.__window_stack = sample
                    self.__test_window_size += 1
                    return None
                else:
                    self.__window_stack = np.vstack(
                        (self.__window_stack, sample))
                    self.__test_window_size += 1
                    return None

    def classify_samples(self, samples):
        """Classify a set of samples. It calls for each sample the function
        classify_sample().
        
        Args:
            samples: Numpy array of shape(x,y)
        
        Returns:
            A vector with the decision for each sample(1/-1).
        """
        predictions = np.empty((0, 0))
        for sample in samples:
            
            sample = sample.reshape((1, sample.size))
            pred = self.classify_sample(sample)
            if pred is not None:
                predictions = np.append(predictions, pred,)
        return predictions
        
    def get_window(self):
        """Returns the window's width
        """
        return self.__window_size
    
    def is_trained(self):
        """Returns True if classifier is trained, False otherwise.
        """
        return bool(self.__trained)

    def export_model(self, name):
        """This function exports to a pickle file the implemented FaultDetector
        object. It exports the self "variable".
        
        Args:
            name: The name/path of exporting file. (type of string)
        """
        if self.__trained == 1:  
            pkl_file = open(name, 'w')
            pickle.dump(self, pkl_file, -1)
            pkl_file.close()
        else:  
            raise ValueError("MODEL HAS NOT BEEN TRAINED YET!")
            
    @staticmethod    
    def load_model(name):           
        """It is a static function, loads and returns from a pickle file an
        implemented FaultDetector object.
        
        Args:
            name: The name of file to load. (type of string)
            
        Returns: 
            An implemented FauldDetector object. (type of the implementation
            e.g. OneClassSVM, GMM).
        """
        if os.path.exists(name):
            pkl_file = open(name, 'r')
            obj = pickle.load(pkl_file)
            pkl_file.close()
            return obj
        else:
            raise ValueError("MODEL HAS NOT BEEN TRAINED YET!")

    def get_params(self):
        """Returns the dictionary with the parameters of detector object.
        """
        return self.__params
    
    def _construct_windows(self, data):
        """This function convert the dataset into windows.
        It has to be called at train_classifier() function in order to convert
        the dataset.
        
        Args:
            data: The initial dataset that will train the classifier. (type of
            np.array(), shape=(n,1))

        Returns: the reconstructed to windows initial dataset.
        """
        
        if self.__window_size == 1:
            return data
        samples, features = np.shape(data)
        dataset = np.empty((0, self.__window_size*features))
        for i in range(0, samples-self.__window_size+1):
            temp = data[i:i+self.__window_size]
            row = temp[::-1].T.reshape(-1)
            dataset = np.vstack((dataset, row))
        return dataset

    def _fit_classifier(self, dataset):
        """Abstract function. The implementation will train the classifier.
        """
        raise NotImplementedError    
        
    def _predict_sample(self, samples):
        """Abstract funtion. The implementation will classify the samples.
        
        Args:
            samples: The samples we want to classify. (type of array)
        
        Returns:
            1: For a non faulty sample.
            -1:For a faulty value.
        """
        raise NotImplementedError

    def get_detector(self):
        """This function returns the model.
        """
        raise NotImplementedError
