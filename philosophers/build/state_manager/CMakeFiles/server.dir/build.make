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
CMAKE_SOURCE_DIR = /home/mike/svn/nasia/trunk/philosophers/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mike/svn/nasia/trunk/philosophers/build

# Include any dependencies generated for this target.
include state_manager/CMakeFiles/server.dir/depend.make

# Include the progress variables for this target.
include state_manager/CMakeFiles/server.dir/progress.make

# Include the compile flags for this target's objects.
include state_manager/CMakeFiles/server.dir/flags.make

state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o: state_manager/CMakeFiles/server.dir/flags.make
state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o: /home/mike/svn/nasia/trunk/philosophers/src/state_manager/src/StateServer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mike/svn/nasia/trunk/philosophers/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o"
	cd /home/mike/svn/nasia/trunk/philosophers/build/state_manager && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/server.dir/src/StateServer.cpp.o -c /home/mike/svn/nasia/trunk/philosophers/src/state_manager/src/StateServer.cpp

state_manager/CMakeFiles/server.dir/src/StateServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server.dir/src/StateServer.cpp.i"
	cd /home/mike/svn/nasia/trunk/philosophers/build/state_manager && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/mike/svn/nasia/trunk/philosophers/src/state_manager/src/StateServer.cpp > CMakeFiles/server.dir/src/StateServer.cpp.i

state_manager/CMakeFiles/server.dir/src/StateServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server.dir/src/StateServer.cpp.s"
	cd /home/mike/svn/nasia/trunk/philosophers/build/state_manager && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/mike/svn/nasia/trunk/philosophers/src/state_manager/src/StateServer.cpp -o CMakeFiles/server.dir/src/StateServer.cpp.s

state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o.requires:
.PHONY : state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o.requires

state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o.provides: state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o.requires
	$(MAKE) -f state_manager/CMakeFiles/server.dir/build.make state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o.provides.build
.PHONY : state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o.provides

state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o.provides.build: state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o

# Object files for target server
server_OBJECTS = \
"CMakeFiles/server.dir/src/StateServer.cpp.o"

# External object files for target server
server_EXTERNAL_OBJECTS =

/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /opt/ros/hydro/lib/libroscpp.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /usr/lib/libboost_signals-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /usr/lib/libboost_filesystem-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /usr/lib/libboost_system-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /opt/ros/hydro/lib/libcpp_common.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /opt/ros/hydro/lib/librostime.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /usr/lib/libboost_date_time-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /usr/lib/libboost_thread-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /opt/ros/hydro/lib/librosconsole.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /usr/lib/libboost_regex-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /usr/lib/liblog4cxx.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: state_manager/CMakeFiles/server.dir/build.make
/home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server: state_manager/CMakeFiles/server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server"
	cd /home/mike/svn/nasia/trunk/philosophers/build/state_manager && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
state_manager/CMakeFiles/server.dir/build: /home/mike/svn/nasia/trunk/philosophers/devel/lib/state_manager/server
.PHONY : state_manager/CMakeFiles/server.dir/build

state_manager/CMakeFiles/server.dir/requires: state_manager/CMakeFiles/server.dir/src/StateServer.cpp.o.requires
.PHONY : state_manager/CMakeFiles/server.dir/requires

state_manager/CMakeFiles/server.dir/clean:
	cd /home/mike/svn/nasia/trunk/philosophers/build/state_manager && $(CMAKE_COMMAND) -P CMakeFiles/server.dir/cmake_clean.cmake
.PHONY : state_manager/CMakeFiles/server.dir/clean

state_manager/CMakeFiles/server.dir/depend:
	cd /home/mike/svn/nasia/trunk/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/svn/nasia/trunk/philosophers/src /home/mike/svn/nasia/trunk/philosophers/src/state_manager /home/mike/svn/nasia/trunk/philosophers/build /home/mike/svn/nasia/trunk/philosophers/build/state_manager /home/mike/svn/nasia/trunk/philosophers/build/state_manager/CMakeFiles/server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : state_manager/CMakeFiles/server.dir/depend

