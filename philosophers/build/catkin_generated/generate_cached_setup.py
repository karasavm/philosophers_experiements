from __future__ import print_function
import argparse
import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/hydro/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/hydro/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in "/home/mike/philosophers_experiments/philosophers/devel;/home/mike/svn/nasia/trunk/philosophers/devel;/home/mike/pandora/pandora_ros_pkgs/pandora_communications/devel;/home/mike/pandora/pandora_ros_pkgs/pandora_runtime/devel;/home/mike/pandora/pandora_ros_pkgs/pandora_robot/devel;/home/mike/pandora/pandora_ros_pkgs/pandora_common/devel;/home/mike/pandora/pandora_gazebo/devel;/home/mike/catkin/devel;/home/mike/turtlebot/devel;/home/mike/catkin_ws/devel;/opt/ros/hydro".split(';'):
        python_path = os.path.join(workspace, 'lib/python2.7/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/mike/philosophers_experiments/philosophers/devel/env.sh')

output_filename = '/home/mike/philosophers_experiments/philosophers/build/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    #print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
