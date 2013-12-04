



	
def create_params_launch(params, path, name='params2.launch', namespace="/philosophers"):
	
	f = open(path+name,'w')
	f.write('<launch>\n')
	for param in params:
		f.write('   <param')
		
		f.write(' name="'+namespace+param['name']+'"')
		f.write(' type="'+param['type']+'"')
		f.write(' value="'+param['value']+'"')
		f.write(' />\n')
	
	f.write('</launch>\n')
	f.close()
	
def create_yaml_file(params, path, name, namespace):
	
	f = open(path+name, 'w')
	for param in params:
		pass
		f.write(namespace+param['name']+': '+param['value']+'\n')
	f.close()
	
def create_parent_launch(path,normal, faulty, name="custom_launch.launch",forks=5,params_name="params.launch"):
	
	total = normal + faulty
	
	f = open(path+name,'w')
	f.write('<launch>\n')
	f.write('	<include file="$(find dining_philosopher)/launch/"'+params_name+'"/>\n')
	f.write('	<include file="$(find dining_philosopher)/launch/nodes.launch"/>\n')
	f.write('\n')
	for i in range(normal,total):
		f.write('	<node name="philosopher'+str(i)+'" type="faulty_philosopher" pkg="dining_philosopher" respawn="false" args="'+str(i)+' forkcnt '+str(forks)+'"/>\n')

	for i in range(normal):
		f.write('	<node name="philosopher'+str(i)+'" type="philosopher" pkg="dining_philosopher" respawn="false" args="'+str(i)+' forkcnt '+str(forks)+'"/>\n')
	
	f.write('</launch>\n')
	f.close()
