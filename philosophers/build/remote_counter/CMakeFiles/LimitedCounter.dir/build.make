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
include remote_counter/CMakeFiles/LimitedCounter.dir/depend.make

# Include the progress variables for this target.
include remote_counter/CMakeFiles/LimitedCounter.dir/progress.make

# Include the compile flags for this target's objects.
include remote_counter/CMakeFiles/LimitedCounter.dir/flags.make

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o: remote_counter/CMakeFiles/LimitedCounter.dir/flags.make
remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o: /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/LimitedCounterStandAlone.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mike/philosophers_experiments/philosophers/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o -c /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/LimitedCounterStandAlone.cpp

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.i"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/LimitedCounterStandAlone.cpp > CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.i

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.s"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/LimitedCounterStandAlone.cpp -o CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.s

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o.requires:
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o.requires

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o.provides: remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o.requires
	$(MAKE) -f remote_counter/CMakeFiles/LimitedCounter.dir/build.make remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o.provides.build
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o.provides

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o.provides.build: remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o

remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o: remote_counter/CMakeFiles/LimitedCounter.dir/flags.make
remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o: /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/RemoteCounter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mike/philosophers_experiments/philosophers/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o -c /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/RemoteCounter.cpp

remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.i"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/RemoteCounter.cpp > CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.i

remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.s"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/RemoteCounter.cpp -o CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.s

remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o.requires:
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o.requires

remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o.provides: remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o.requires
	$(MAKE) -f remote_counter/CMakeFiles/LimitedCounter.dir/build.make remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o.provides.build
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o.provides

remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o.provides.build: remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o: remote_counter/CMakeFiles/LimitedCounter.dir/flags.make
remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o: /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/LimitedCounter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mike/philosophers_experiments/philosophers/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o -c /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/LimitedCounter.cpp

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.i"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/LimitedCounter.cpp > CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.i

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.s"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/mike/philosophers_experiments/philosophers/src/remote_counter/src/LimitedCounter.cpp -o CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.s

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o.requires:
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o.requires

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o.provides: remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o.requires
	$(MAKE) -f remote_counter/CMakeFiles/LimitedCounter.dir/build.make remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o.provides.build
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o.provides

remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o.provides.build: remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o

# Object files for target LimitedCounter
LimitedCounter_OBJECTS = \
"CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o" \
"CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o" \
"CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o"

# External object files for target LimitedCounter
LimitedCounter_EXTERNAL_OBJECTS =

/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /opt/ros/hydro/lib/libroscpp.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /usr/lib/libboost_signals-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /usr/lib/libboost_filesystem-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /usr/lib/libboost_system-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /opt/ros/hydro/lib/libcpp_common.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /opt/ros/hydro/lib/librostime.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /usr/lib/libboost_date_time-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /usr/lib/libboost_thread-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /opt/ros/hydro/lib/librosconsole.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /usr/lib/libboost_regex-mt.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /usr/lib/liblog4cxx.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: remote_counter/CMakeFiles/LimitedCounter.dir/build.make
/home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter: remote_counter/CMakeFiles/LimitedCounter.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter"
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LimitedCounter.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
remote_counter/CMakeFiles/LimitedCounter.dir/build: /home/mike/philosophers_experiments/philosophers/devel/lib/remote_counter/LimitedCounter
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/build

remote_counter/CMakeFiles/LimitedCounter.dir/requires: remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounterStandAlone.cpp.o.requires
remote_counter/CMakeFiles/LimitedCounter.dir/requires: remote_counter/CMakeFiles/LimitedCounter.dir/src/RemoteCounter.cpp.o.requires
remote_counter/CMakeFiles/LimitedCounter.dir/requires: remote_counter/CMakeFiles/LimitedCounter.dir/src/LimitedCounter.cpp.o.requires
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/requires

remote_counter/CMakeFiles/LimitedCounter.dir/clean:
	cd /home/mike/philosophers_experiments/philosophers/build/remote_counter && $(CMAKE_COMMAND) -P CMakeFiles/LimitedCounter.dir/cmake_clean.cmake
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/clean

remote_counter/CMakeFiles/LimitedCounter.dir/depend:
	cd /home/mike/philosophers_experiments/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/philosophers_experiments/philosophers/src /home/mike/philosophers_experiments/philosophers/src/remote_counter /home/mike/philosophers_experiments/philosophers/build /home/mike/philosophers_experiments/philosophers/build/remote_counter /home/mike/philosophers_experiments/philosophers/build/remote_counter/CMakeFiles/LimitedCounter.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : remote_counter/CMakeFiles/LimitedCounter.dir/depend

