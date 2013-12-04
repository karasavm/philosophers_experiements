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
include dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/depend.make

# Include the progress variables for this target.
include dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/progress.make

# Include the compile flags for this target's objects.
include dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/flags.make

dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o: dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/flags.make
dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o: /home/mike/philosophers_experiments/philosophers/src/dining_philosopher/src/MonitoredPhilosopher-main.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mike/philosophers_experiments/philosophers/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o"
	cd /home/mike/philosophers_experiments/philosophers/build/dining_philosopher && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o -c /home/mike/philosophers_experiments/philosophers/src/dining_philosopher/src/MonitoredPhilosopher-main.cc

dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.i"
	cd /home/mike/philosophers_experiments/philosophers/build/dining_philosopher && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/mike/philosophers_experiments/philosophers/src/dining_philosopher/src/MonitoredPhilosopher-main.cc > CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.i

dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.s"
	cd /home/mike/philosophers_experiments/philosophers/build/dining_philosopher && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/mike/philosophers_experiments/philosophers/src/dining_philosopher/src/MonitoredPhilosopher-main.cc -o CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.s

dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o.requires:
.PHONY : dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o.requires

dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o.provides: dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o.requires
	$(MAKE) -f dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/build.make dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o.provides.build
.PHONY : dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o.provides

dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o.provides.build: dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o

# Object files for target monitoredPhilosopher
monitoredPhilosopher_OBJECTS = \
"CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o"

# External object files for target monitoredPhilosopher
monitoredPhilosopher_EXTERNAL_OBJECTS =

/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /home/mike/philosophers_experiments/philosophers/devel/lib/libPhilosopherLib.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /home/mike/philosophers_experiments/philosophers/devel/lib/libWatchedPhilosopherLib.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /home/mike/philosophers_experiments/philosophers/devel/lib/libMonitoredPhilosopherLib.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /home/mike/philosophers_experiments/philosophers/devel/lib/libWatchdog.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /home/mike/philosophers_experiments/philosophers/devel/lib/libStateClient.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /home/mike/philosophers_experiments/philosophers/devel/lib/libRemoteMutex.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /opt/ros/hydro/lib/libroscpp.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /usr/lib/libboost_signals-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /usr/lib/libboost_filesystem-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /usr/lib/libboost_system-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /opt/ros/hydro/lib/libcpp_common.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /opt/ros/hydro/lib/librostime.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /usr/lib/libboost_date_time-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /usr/lib/libboost_thread-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /opt/ros/hydro/lib/librosconsole.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /usr/lib/libboost_regex-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /usr/lib/liblog4cxx.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/build.make
/home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher: dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher"
	cd /home/mike/philosophers_experiments/philosophers/build/dining_philosopher && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/monitoredPhilosopher.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/build: /home/mike/philosophers_experiments/philosophers/devel/lib/dining_philosopher/monitoredPhilosopher
.PHONY : dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/build

dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/requires: dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/src/MonitoredPhilosopher-main.cc.o.requires
.PHONY : dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/requires

dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/clean:
	cd /home/mike/philosophers_experiments/philosophers/build/dining_philosopher && $(CMAKE_COMMAND) -P CMakeFiles/monitoredPhilosopher.dir/cmake_clean.cmake
.PHONY : dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/clean

dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/depend:
	cd /home/mike/philosophers_experiments/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/philosophers_experiments/philosophers/src /home/mike/philosophers_experiments/philosophers/src/dining_philosopher /home/mike/philosophers_experiments/philosophers/build /home/mike/philosophers_experiments/philosophers/build/dining_philosopher /home/mike/philosophers_experiments/philosophers/build/dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dining_philosopher/CMakeFiles/monitoredPhilosopher.dir/depend

