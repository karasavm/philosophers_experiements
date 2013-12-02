import pylab 
import numpy
import matplotlib.pyplot as plt

#####################
SUBDIR = "results/50+1Normal/"
SUBDIR = ""
MODE = "train"       
#####################


phil_hungers = numpy.loadtxt(open(SUBDIR+MODE+'_set.csv')).T  # Each line contains the philosopher's values

phil_number, values = numpy.shape(phil_hungers)
time = numpy.arange(0,values/2.0,0.5)



for i in range(5):
	plt.figure()
	plt.suptitle('Philosophers form %d-%d' % (i*10, i*10+9))
	plt.subplot(11,1,1)
	#plt.xlabel('Time in secs')
	#plt.ylabel('Hunger Levels NORMAL_philosopher')
	plt.plot(time, phil_hungers[50])
	for j in range(10):
		
		plt.subplot(11,1,str(j+2))
		#plt.xlabel('Time in secs')
		#plt.ylabel('Hunger Levels %d_philosopher'%(i*5+j))
		plt.plot(time, phil_hungers[i*10+j])
		
	plt.savefig('plots/'+str(i*10)+'-'+str(i*10+9))
		
#plt.show()
		

