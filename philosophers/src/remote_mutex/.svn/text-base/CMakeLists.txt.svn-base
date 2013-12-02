cmake_minimum_required(VERSION 2.8.3)
project(remote_mutex)
find_package(catkin REQUIRED COMPONENTS roscpp message_generation std_msgs)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
#set(ROS_BUILD_TYPE RelWithDebInfo)


#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

add_service_files(
	FILES
	mutexSrv.srv
	)

generate_messages(
  DEPENDENCIES std_msgs
)


catkin_package(
    DEPENDS
    CATKIN-DEPENDS 
    INCLUDE_DIRS include
    LIBRARIES RemoteMutex
)

include_directories(include
  ${catkin_INCLUDE_DIRS}
)

include_directories(${Boost_INCLUDE_DIRS})


add_library(RemoteMutex src/RemoteMutex.cpp)
target_link_libraries(RemoteMutex ${catkin_LIBRARIES} )
add_dependencies(RemoteMutex remote_mutex_gencpp)

add_library(MutexGuard src/MutexGuard.cpp)
target_link_libraries(MutexGuard ${catkin_LIBRARIES} )
add_dependencies(MutexGuard remote_mutex_gencpp)

add_executable(mutex src/StandaloneMutex.cpp src/MutexGuard.cpp)
target_link_libraries(mutex ${catkin_LIBRARIES} )
add_dependencies(mutex remote_mutex_gencpp)
