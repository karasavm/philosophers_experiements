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
include watchdog_timer/CMakeFiles/Watchdog.dir/depend.make

# Include the progress variables for this target.
include watchdog_timer/CMakeFiles/Watchdog.dir/progress.make

# Include the compile flags for this target's objects.
include watchdog_timer/CMakeFiles/Watchdog.dir/flags.make

watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o: watchdog_timer/CMakeFiles/Watchdog.dir/flags.make
watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o: /home/mike/svn/nasia/trunk/philosophers/src/watchdog_timer/src/Watchdog.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mike/svn/nasia/trunk/philosophers/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o"
	cd /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o -c /home/mike/svn/nasia/trunk/philosophers/src/watchdog_timer/src/Watchdog.cpp

watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Watchdog.dir/src/Watchdog.cpp.i"
	cd /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/mike/svn/nasia/trunk/philosophers/src/watchdog_timer/src/Watchdog.cpp > CMakeFiles/Watchdog.dir/src/Watchdog.cpp.i

watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Watchdog.dir/src/Watchdog.cpp.s"
	cd /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/mike/svn/nasia/trunk/philosophers/src/watchdog_timer/src/Watchdog.cpp -o CMakeFiles/Watchdog.dir/src/Watchdog.cpp.s

watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o.requires:
.PHONY : watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o.requires

watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o.provides: watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o.requires
	$(MAKE) -f watchdog_timer/CMakeFiles/Watchdog.dir/build.make watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o.provides.build
.PHONY : watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o.provides

watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o.provides.build: watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o

# Object files for target Watchdog
Watchdog_OBJECTS = \
"CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o"

# External object files for target Watchdog
Watchdog_EXTERNAL_OBJECTS =

/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /opt/ros/hydro/lib/libroscpp.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /usr/lib/libboost_signals-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /usr/lib/libboost_filesystem-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /usr/lib/libboost_system-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /opt/ros/hydro/lib/libcpp_common.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /opt/ros/hydro/lib/libroscpp_serialization.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /opt/ros/hydro/lib/librostime.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /usr/lib/libboost_date_time-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /usr/lib/libboost_thread-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /opt/ros/hydro/lib/librosconsole.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /usr/lib/libboost_regex-mt.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /usr/lib/liblog4cxx.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: /opt/ros/hydro/lib/libxmlrpcpp.so
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: watchdog_timer/CMakeFiles/Watchdog.dir/build.make
/home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so: watchdog_timer/CMakeFiles/Watchdog.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library /home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so"
	cd /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Watchdog.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
watchdog_timer/CMakeFiles/Watchdog.dir/build: /home/mike/svn/nasia/trunk/philosophers/devel/lib/libWatchdog.so
.PHONY : watchdog_timer/CMakeFiles/Watchdog.dir/build

watchdog_timer/CMakeFiles/Watchdog.dir/requires: watchdog_timer/CMakeFiles/Watchdog.dir/src/Watchdog.cpp.o.requires
.PHONY : watchdog_timer/CMakeFiles/Watchdog.dir/requires

watchdog_timer/CMakeFiles/Watchdog.dir/clean:
	cd /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer && $(CMAKE_COMMAND) -P CMakeFiles/Watchdog.dir/cmake_clean.cmake
.PHONY : watchdog_timer/CMakeFiles/Watchdog.dir/clean

watchdog_timer/CMakeFiles/Watchdog.dir/depend:
	cd /home/mike/svn/nasia/trunk/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/svn/nasia/trunk/philosophers/src /home/mike/svn/nasia/trunk/philosophers/src/watchdog_timer /home/mike/svn/nasia/trunk/philosophers/build /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer/CMakeFiles/Watchdog.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : watchdog_timer/CMakeFiles/Watchdog.dir/depend

