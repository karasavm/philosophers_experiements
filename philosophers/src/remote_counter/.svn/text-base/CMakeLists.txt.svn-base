cmake_minimum_required(VERSION 2.8.3)
project(remote_counter)
find_package(catkin REQUIRED COMPONENTS roscpp message_generation diagnostic_updater std_msgs diagnostic_msgs)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
set(ROS_BUILD_TYPE RelWithDebInfo)


#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

add_service_files(
	FILES
	countingSrv.srv
	)


include_directories(${Boost_INCLUDE_DIRS})

generate_messages(DEPENDENCIES std_msgs)

catkin_package(
    DEPENDS
    CATKIN-DEPENDS
    INCLUDE_DIRS include
    LIBRARIES # TODO
)

include_directories(include
  ${catkin_INCLUDE_DIRS}
)

add_executable(RemoteCounter src/RemoteCounterStandAlone.cpp src/RemoteCounter.cpp)
target_link_libraries(RemoteCounter ${catkin_LIBRARIES} )
add_dependencies(RemoteCounter remote_counter_gencpp)

add_executable(LimitedCounter src/LimitedCounterStandAlone.cpp src/RemoteCounter.cpp src/LimitedCounter.cpp)
target_link_libraries(LimitedCounter ${catkin_LIBRARIES} )
add_dependencies(LimitedCounter remote_counter_gencpp)

add_executable(RemotePositiveCounter src/RemotePositiveCounterStandAlone.cpp src/RemoteCounter.cpp src/RemotePositiveCounter.cpp)
target_link_libraries(RemotePositiveCounter ${catkin_LIBRARIES} )
add_dependencies(RemotePositiveCounter remote_counter_gencpp)
