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

# Utility rule file for watchdog_timer_gencpp.

# Include the progress variables for this target.
include watchdog_timer/CMakeFiles/watchdog_timer_gencpp.dir/progress.make

watchdog_timer/CMakeFiles/watchdog_timer_gencpp:

watchdog_timer_gencpp: watchdog_timer/CMakeFiles/watchdog_timer_gencpp
watchdog_timer_gencpp: watchdog_timer/CMakeFiles/watchdog_timer_gencpp.dir/build.make
.PHONY : watchdog_timer_gencpp

# Rule to build all files generated by this target.
watchdog_timer/CMakeFiles/watchdog_timer_gencpp.dir/build: watchdog_timer_gencpp
.PHONY : watchdog_timer/CMakeFiles/watchdog_timer_gencpp.dir/build

watchdog_timer/CMakeFiles/watchdog_timer_gencpp.dir/clean:
	cd /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer && $(CMAKE_COMMAND) -P CMakeFiles/watchdog_timer_gencpp.dir/cmake_clean.cmake
.PHONY : watchdog_timer/CMakeFiles/watchdog_timer_gencpp.dir/clean

watchdog_timer/CMakeFiles/watchdog_timer_gencpp.dir/depend:
	cd /home/mike/svn/nasia/trunk/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/svn/nasia/trunk/philosophers/src /home/mike/svn/nasia/trunk/philosophers/src/watchdog_timer /home/mike/svn/nasia/trunk/philosophers/build /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer /home/mike/svn/nasia/trunk/philosophers/build/watchdog_timer/CMakeFiles/watchdog_timer_gencpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : watchdog_timer/CMakeFiles/watchdog_timer_gencpp.dir/depend

