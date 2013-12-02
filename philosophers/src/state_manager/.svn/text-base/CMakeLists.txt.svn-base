cmake_minimum_required(VERSION 2.8.3)
project(state_manager)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
#set(ROS_BUILD_TYPE RelWithDebInfo)

find_package(catkin REQUIRED COMPONENTS roscpp std_msgs state_manager_communications)
catkin_package(
   INCLUDE_DIRS include
   CATKIN_DEPENDS 
   LIBRARIES StateClient
   CATKIN_DEPENDS roscpp
	DEPENDS 
)


#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

## Specify additional locations of header files
include_directories(include
  ${catkin_INCLUDE_DIRS}
)

add_executable(stateChanger src/StateChanger.cpp src/StateClient.cpp)
target_link_libraries(stateChanger ${catkin_LIBRARIES} )
add_dependencies(stateChanger state_manager_communications_gencpp)

add_executable(server src/StateServer.cpp)
target_link_libraries(server ${catkin_LIBRARIES} )
add_dependencies(server state_manager_communications_gencpp)

add_library(StateClient src/StateClient.cpp)
target_link_libraries(StateClient ${catkin_LIBRARIES} )
add_dependencies(StateClient state_manager_communications_gencpp)
