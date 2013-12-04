# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mike/philosophers_experiments/philosophers/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mike/philosophers_experiments/philosophers/build

# Include any dependencies generated for this target.
include state_manager/CMakeFiles/StateClient.dir/depend.make

# Include the progress variables for this target.
include state_manager/CMakeFiles/StateClient.dir/progress.make

# Include the compile flags for this target's objects.
include state_manager/CMakeFiles/StateClient.dir/flags.make

state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o: state_manager/CMakeFiles/StateClient.dir/flags.make
state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o: /home/mike/philosophers_experiments/philosophers/src/state_manager/src/StateClient.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mike/philosophers_experiments/philosophers/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o"
	cd /home/mike/philosophers_experiments/philosophers/build/state_manager && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/StateClient.dir/src/StateClient.cpp.o -c /home/mike/philosophers_experiments/philosophers/src/state_manager/src/StateClient.cpp

state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/StateClient.dir/src/StateClient.cpp.i"
	cd /home/mike/philosophers_experiments/philosophers/build/state_manager && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/mike/philosophers_experiments/philosophers/src/state_manager/src/StateClient.cpp > CMakeFiles/StateClient.dir/src/StateClient.cpp.i

state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/StateClient.dir/src/StateClient.cpp.s"
	cd /home/mike/philosophers_experiments/philosophers/build/state_manager && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/mike/philosophers_experiments/philosophers/src/state_manager/src/StateClient.cpp -o CMakeFiles/StateClient.dir/src/StateClient.cpp.s

state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o.requires:
.PHONY : state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o.requires

state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o.provides: state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o.requires
	$(MAKE) -f state_manager/CMakeFiles/StateClient.dir/build.make state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o.provides.build
.PHONY : state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o.provides

state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o.provides.build: state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o

# Object files for target StateClient
StateClient_OBJECTS = \
"CMakeFiles/StateClient.dir/src/StateClient.cpp.o"

# External object files for target StateClient
StateClient_EXTERNAL_OBJECTS =

/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /opt/ros/hydro/lib/libroscpp.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /usr/lib/libboost_signals-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /usr/lib/libboost_filesystem-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /usr/lib/libboost_system-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /opt/ros/hydro/lib/libcpp_common.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /opt/ros/hydro/lib/librostime.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /usr/lib/libboost_date_time-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /usr/lib/libboost_thread-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /opt/ros/hydro/lib/librosconsole.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /usr/lib/libboost_regex-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /usr/lib/liblog4cxx.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: state_manager/CMakeFiles/StateClient.dir/build.make
/home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so: state_manager/CMakeFiles/StateClient.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library /home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so"
	cd /home/mike/philosophers_experiments/philosophers/build/state_manager && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/StateClient.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
state_manager/CMakeFiles/StateClient.dir/build: /home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so
.PHONY : state_manager/CMakeFiles/StateClient.dir/build

state_manager/CMakeFiles/StateClient.dir/requires: state_manager/CMakeFiles/StateClient.dir/src/StateClient.cpp.o.requires
.PHONY : state_manager/CMakeFiles/StateClient.dir/requires

state_manager/CMakeFiles/StateClient.dir/clean:
	cd /home/mike/philosophers_experiments/philosophers/build/state_manager && $(CMAKE_COMMAND) -P CMakeFiles/StateClient.dir/cmake_clean.cmake
.PHONY : state_manager/CMakeFiles/StateClient.dir/clean

state_manager/CMakeFiles/StateClient.dir/depend:
	cd /home/mike/philosophers_experiments/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/philosophers_experiments/philosophers/src /home/mike/philosophers_experiments/philosophers/src/state_manager /home/mike/philosophers_experiments/philosophers/build /home/mike/philosophers_experiments/philosophers/build/state_manager /home/mike/philosophers_experiments/philosophers/build/state_manager/CMakeFiles/StateClient.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : state_manager/CMakeFiles/StateClient.dir/depend

