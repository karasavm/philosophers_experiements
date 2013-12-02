import pylab 
import numpy
import matplotlib.pyplot as plt

#####################
SUBDIR = "results/exp0/"
MODE = "normal"       
#####################


phil_hungers = numpy.loadtxt(open(SUBDIR+MODE+'_set.csv')).T

phil_number, values = numpy.shape(phil_hungers)
time = numpy.arange(0,values/2.0,0.5)

temp = numpy.empty((values,1))






for i in range(5):
	plt.figure()
	plt.suptitle('Philosophers form %d-%d' % (i*10, i*10+4))
	plt.subplot(11,1,1)
	#plt.xlabel('Time in secs')
	#plt.ylabel('Hunger Levels NORMAL_philosopher')
	plt.plot(time, phil_hungers[49])
	for j in range(10):
		
		plt.subplot(11,1,str(j+2))
		#plt.xlabel('Time in secs')
		#plt.ylabel('Hunger Levels %d_philosopher'%(i*5+j))
		plt.plot(time, phil_hungers[i*10+j])
		
plt.show()
		

