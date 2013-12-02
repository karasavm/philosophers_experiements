cmake_minimum_required(VERSION 2.8.3)
project(erratic_state_changer)
find_package(catkin REQUIRED COMPONENTS roscpp state_manager state_manager_communications)

catkin_package(
    DEPENDS 
    CATKIN-DEPENDS 
    INCLUDE_DIRS 
    LIBRARIES 
)

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

include_directories(include
  ${catkin_INCLUDE_DIRS}
)


add_library(${PROJECT_NAME} src/ErraticStateChanger.cc)
target_link_libraries(${PROJECT_NAME} ${catkin_LIBRARIES} )
add_dependencies(${PROJECT_NAME} state_manager_communications_gencpp)

add_executable(erraticStateChanger src/ErraticStateChanger-main.cc)
target_link_libraries(erraticStateChanger ${catkin_LIBRARIES} )
target_link_libraries(erraticStateChanger ${PROJECT_NAME})
add_dependencies(erraticStateChanger state_manager_communications_gencpp)
