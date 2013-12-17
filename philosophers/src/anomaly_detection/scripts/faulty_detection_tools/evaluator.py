"""This module contains only the class Evaluator. In this module we use 
module numpy.
"""
import numpy as np

class Evaluator:
    """It is a class that evaluates with fpr and detection rate metrics a test 
    set. The results from the testing are taken form a specific FaulDetector 
    Object. 
    """
    def __init__(self, detector):
        """Initiallize the Evaluator instance. 
        
        Args:
            detector: a FaultdDetector instance that will classify the samples 
			from a given testset.
        """
        # initialize object detector. FaultDetector type.
        self.__detector = detector
	
    def get_metrics(self, testset, behaviours):
        """ Calculate and returns the fpr and detection rate for the given 
        testset. It uses the detector(cosntructor's input) for getting the 
        results.
        
        Args:
            testset: a numpy array of samples.
            behaviours: a numpy array with behaviours. 1 for faulty 0 for non 
            faulty value.
        
        Returns:
		    A dictionary with the metrics tha have been computed.
		    Dict keys = ['detection_rate', 'fpr']
        """
        predictions = self.__detector.classify_samples(testset)
        predictions, behaviours = self.__reconfigure(predictions, behaviours)
        
       
        beh = behaviours
        pred = predictions.reshape((predictions.size, 1))
        
        temp = pred[beh == 1]
        detection_rate = round(temp[temp==1].size/float(beh[beh==1].size), 3)
        temp = pred[beh == 0]
        fpr = round(temp[temp == 1].size/float(beh[beh==0].size), 3)

        return {'detection_rate':detection_rate, 'fpr':fpr}
        
    def __reconfigure(self, predictions, behaviours):
        """In case of window usage it is important to construct a new vector
        with the bahaviours of windows not only the behaviour of one value.
        This function does this job. Further more predictions vector indicates 
        a faulty value with -1 and a non faulty with 1. This function 
        reconstruct predictions vector to indecate a faulty with 1 and a non
        faulty with 0.
        		
        Args:
            predictions: A vector that contains 1 for a non faulty value and
            -1 for a faulty. This vector it has been created after a 
            classification procedure.
            behaviours: A vector that contains 0 for a non faulty value and
            1 for a faulty. This vector indicates the actual "label" 
            faulty/non-faulty of a value.
                    
        Returns:
            The reconstructes predictions and behaviours vectors.        
        """
        
        # reconstruct predictions vector
        predictions = predictions * (-0.5) + 0.5 
        window = self.__detector.get_window()
        
        if window == 1:
            return predictions, behaviours

        # reconstruct behaviours vector for windows perpose
        beh = []
        for i in range(predictions.size):
            for j in range(window):
                if behaviours[i+j] == 1:
                    beh.append(1)
                    break
            else:
                beh.append(0)
        
        return predictions, np.array(beh)
        
    def get_detector(self):
        """This function returns the trained FaultDetector object that this
        Evaluator object uses.
        
        Returns:
            A trained FaultDetector object.
        """
        return self.__detector




