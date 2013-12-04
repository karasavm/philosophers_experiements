cmake_minimum_required(VERSION 2.8.3)
project(dining_philosopher)

find_package(catkin REQUIRED COMPONENTS roscpp dining_philosopher_communications watchdog_timer state_manager state_manager_communications remote_counter diagnostic_updater remote_mutex)
# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
#set(ROS_BUILD_TYPE RelWithDebInfo)

catkin_package(
    DEPENDS 
    CATKIN-DEPENDS 
    INCLUDE_DIRS 
    LIBRARIES 
)

include_directories(include
  ${catkin_INCLUDE_DIRS}
)

#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)


add_library(PhilosopherLib src/Philosopher.cc)
target_link_libraries(PhilosopherLib ${catkin_LIBRARIES} )
add_dependencies(PhilosopherLib remote_counter_gencpp)


add_library(WatchedPhilosopherLib src/WatchedPhilosopher.cc)
target_link_libraries(WatchedPhilosopherLib ${catkin_LIBRARIES} )

add_library(MonitoredPhilosopherLib src/MonitoredPhilosopher.cc)
target_link_libraries(MonitoredPhilosopherLib ${catkin_LIBRARIES} )

add_executable(philosopher src/Philosopher-main.cc)
target_link_libraries(philosopher PhilosopherLib)
#########################################################
#####-----------FAULTY PHILOSOPHERS-----------###########

#########       CONSTANT
#add_library(ConstantPhilosopherLib src/faulty_philosophers/ConstantPhilosopher.cc)
#target_link_libraries(ConstantPhilosopherLib ${catkin_LIBRARIES} )
#add_dependencies(ConstantPhilosopherLib remote_counter_gencpp)

#add_executable(constant_philosopher src/faulty_philosophers/ConstantPhilosopher-main.cc)
#target_link_libraries(constant_philosopher ConstantPhilosopherLib)
#########


#add_executable(eating_hungring_rates_philosopher src/faulty_philosophers/EatingHungringRatesPhilosopher.cc)
#target_link_libraries(eating_hungring_rates_philosopher ${catkin_LIBRARIES})

add_executable(faulty_philosopher src/faulty_philosophers/FaultyPhilosopher.cc)
target_link_libraries(faulty_philosopher ${catkin_LIBRARIES})

#########################################################

add_executable(watchedPhilosopher src/WatchedPhilosopher-main.cc)
target_link_libraries(watchedPhilosopher PhilosopherLib WatchedPhilosopherLib)

add_executable(monitoredPhilosopher src/MonitoredPhilosopher-main.cc)
target_link_libraries(monitoredPhilosopher PhilosopherLib WatchedPhilosopherLib MonitoredPhilosopherLib)

add_library(PhilosopherStatsLib src/PhilosopherStats.cc)
target_link_libraries(PhilosopherStatsLib ${catkin_LIBRARIES} )


add_executable(philosopherStats src/PhilosopherStats-main.cc)
target_link_libraries(philosopherStats PhilosopherStatsLib)
target_link_libraries(philosopherStats ${catkin_LIBRARIES} )
