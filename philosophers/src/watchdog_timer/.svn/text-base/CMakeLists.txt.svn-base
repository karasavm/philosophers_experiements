cmake_minimum_required(VERSION 2.8.3)
project(watchdog_timer)
find_package(catkin REQUIRED COMPONENTS roscpp message_generation)

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

add_message_files(
  FILES
  watchdogResetMsg.msg
  wdtTimeoutNotificationMsg.msg
)

add_service_files(
  FILES
  watchdogSrv.srv
)

generate_messages(
	DEPENDENCIES std_msgs
	)

# TODO: fill in what other packages will need to use this package
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
    DEPENDS  
    CATKIN-DEPENDS 
    INCLUDE_DIRS include
    LIBRARIES Watchdog
)

include_directories(include
  ${catkin_INCLUDE_DIRS}
)

add_library(Watchdog src/Watchdog.cpp)
#set_target_properties(Watchdog PROPERTIES COMPILE_FLAGS -I${PROJECT_SOURCE_DIR}/src/)
target_link_libraries(Watchdog ${catkin_LIBRARIES} )
add_dependencies(Watchdog watchdog_timer_gencpp)


add_executable(wdtMonitor src/WatchdogMonitor.cpp)
target_link_libraries(wdtMonitor ${catkin_LIBRARIES} )
add_dependencies(wdtMonitor watchdog_timer_gencpp)
