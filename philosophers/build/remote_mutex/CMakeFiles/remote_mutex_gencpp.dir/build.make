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

# Utility rule file for remote_mutex_gencpp.

# Include the progress variables for this target.
include remote_mutex/CMakeFiles/remote_mutex_gencpp.dir/progress.make

remote_mutex/CMakeFiles/remote_mutex_gencpp:

remote_mutex_gencpp: remote_mutex/CMakeFiles/remote_mutex_gencpp
remote_mutex_gencpp: remote_mutex/CMakeFiles/remote_mutex_gencpp.dir/build.make
.PHONY : remote_mutex_gencpp

# Rule to build all files generated by this target.
remote_mutex/CMakeFiles/remote_mutex_gencpp.dir/build: remote_mutex_gencpp
.PHONY : remote_mutex/CMakeFiles/remote_mutex_gencpp.dir/build

remote_mutex/CMakeFiles/remote_mutex_gencpp.dir/clean:
	cd /home/mike/svn/nasia/trunk/philosophers/build/remote_mutex && $(CMAKE_COMMAND) -P CMakeFiles/remote_mutex_gencpp.dir/cmake_clean.cmake
.PHONY : remote_mutex/CMakeFiles/remote_mutex_gencpp.dir/clean

remote_mutex/CMakeFiles/remote_mutex_gencpp.dir/depend:
	cd /home/mike/svn/nasia/trunk/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/svn/nasia/trunk/philosophers/src /home/mike/svn/nasia/trunk/philosophers/src/remote_mutex /home/mike/svn/nasia/trunk/philosophers/build /home/mike/svn/nasia/trunk/philosophers/build/remote_mutex /home/mike/svn/nasia/trunk/philosophers/build/remote_mutex/CMakeFiles/remote_mutex_gencpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : remote_mutex/CMakeFiles/remote_mutex_gencpp.dir/depend
