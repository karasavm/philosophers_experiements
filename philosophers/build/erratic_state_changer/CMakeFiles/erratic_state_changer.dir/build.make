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
include erratic_state_changer/CMakeFiles/erratic_state_changer.dir/depend.make

# Include the progress variables for this target.
include erratic_state_changer/CMakeFiles/erratic_state_changer.dir/progress.make

# Include the compile flags for this target's objects.
include erratic_state_changer/CMakeFiles/erratic_state_changer.dir/flags.make

erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o: erratic_state_changer/CMakeFiles/erratic_state_changer.dir/flags.make
erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o: /home/mike/svn/nasia/trunk/philosophers/src/erratic_state_changer/src/ErraticStateChanger.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mike/svn/nasia/trunk/philosophers/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o"
	cd /home/mike/svn/nasia/trunk/philosophers/build/erratic_state_changer && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o -c /home/mike/svn/nasia/trunk/philosophers/src/erratic_state_changer/src/ErraticStateChanger.cc

erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.i"
	cd /home/mike/svn/nasia/trunk/philosophers/build/erratic_state_changer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/mike/svn/nasia/trunk/philosophers/src/erratic_state_changer/src/ErraticStateChanger.cc > CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.i

erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.s"
	cd /home/mike/svn/nasia/trunk/philosophers/build/erratic_state_changer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/mike/svn/nasia/trunk/philosophers/src/erratic_state_changer/src/ErraticStateChanger.cc -o CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.s

erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o.requires:
.PHONY : erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o.requires

erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o.provides: erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o.requires
	$(MAKE) -f erratic_state_changer/CMakeFiles/erratic_state_changer.dir/build.make erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o.provides.build
.PHONY : erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o.provides

erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o.provides.build: erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o

# Object files for target erratic_state_changer
erratic_state_changer_OBJECTS = \
"CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o"

# External object files for target erratic_state_changer
erratic_state_changer_EXTERNAL_OBJECTS =

/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/libroscpp.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_signals-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_filesystem-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_system-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/libcpp_common.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/librostime.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_date_time-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_thread-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/librosconsole.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_regex-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/liblog4cxx.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /home/mike/svn/nasia/trunk/philosophers/devel/lib/libStateClient.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/libroscpp.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_signals-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_filesystem-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_system-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/libcpp_common.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/librostime.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_date_time-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_thread-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/librosconsole.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/libboost_regex-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /usr/lib/liblog4cxx.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: erratic_state_changer/CMakeFiles/erratic_state_changer.dir/build.make
/home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so: erratic_state_changer/CMakeFiles/erratic_state_changer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library /home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so"
	cd /home/mike/svn/nasia/trunk/philosophers/build/erratic_state_changer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/erratic_state_changer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
erratic_state_changer/CMakeFiles/erratic_state_changer.dir/build: /home/mike/svn/nasia/trunk/philosophers/devel/lib/liberratic_state_changer.so
.PHONY : erratic_state_changer/CMakeFiles/erratic_state_changer.dir/build

erratic_state_changer/CMakeFiles/erratic_state_changer.dir/requires: erratic_state_changer/CMakeFiles/erratic_state_changer.dir/src/ErraticStateChanger.cc.o.requires
.PHONY : erratic_state_changer/CMakeFiles/erratic_state_changer.dir/requires

erratic_state_changer/CMakeFiles/erratic_state_changer.dir/clean:
	cd /home/mike/svn/nasia/trunk/philosophers/build/erratic_state_changer && $(CMAKE_COMMAND) -P CMakeFiles/erratic_state_changer.dir/cmake_clean.cmake
.PHONY : erratic_state_changer/CMakeFiles/erratic_state_changer.dir/clean

erratic_state_changer/CMakeFiles/erratic_state_changer.dir/depend:
	cd /home/mike/svn/nasia/trunk/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/svn/nasia/trunk/philosophers/src /home/mike/svn/nasia/trunk/philosophers/src/erratic_state_changer /home/mike/svn/nasia/trunk/philosophers/build /home/mike/svn/nasia/trunk/philosophers/build/erratic_state_changer /home/mike/svn/nasia/trunk/philosophers/build/erratic_state_changer/CMakeFiles/erratic_state_changer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : erratic_state_changer/CMakeFiles/erratic_state_changer.dir/depend
