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

# Utility rule file for state_manager_communications_genlisp.

# Include the progress variables for this target.
include state_manager_communications/CMakeFiles/state_manager_communications_genlisp.dir/progress.make

state_manager_communications/CMakeFiles/state_manager_communications_genlisp:

state_manager_communications_genlisp: state_manager_communications/CMakeFiles/state_manager_communications_genlisp
state_manager_communications_genlisp: state_manager_communications/CMakeFiles/state_manager_communications_genlisp.dir/build.make
.PHONY : state_manager_communications_genlisp

# Rule to build all files generated by this target.
state_manager_communications/CMakeFiles/state_manager_communications_genlisp.dir/build: state_manager_communications_genlisp
.PHONY : state_manager_communications/CMakeFiles/state_manager_communications_genlisp.dir/build

state_manager_communications/CMakeFiles/state_manager_communications_genlisp.dir/clean:
	cd /home/mike/svn/nasia/trunk/philosophers/build/state_manager_communications && $(CMAKE_COMMAND) -P CMakeFiles/state_manager_communications_genlisp.dir/cmake_clean.cmake
.PHONY : state_manager_communications/CMakeFiles/state_manager_communications_genlisp.dir/clean

state_manager_communications/CMakeFiles/state_manager_communications_genlisp.dir/depend:
	cd /home/mike/svn/nasia/trunk/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/svn/nasia/trunk/philosophers/src /home/mike/svn/nasia/trunk/philosophers/src/state_manager_communications /home/mike/svn/nasia/trunk/philosophers/build /home/mike/svn/nasia/trunk/philosophers/build/state_manager_communications /home/mike/svn/nasia/trunk/philosophers/build/state_manager_communications/CMakeFiles/state_manager_communications_genlisp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : state_manager_communications/CMakeFiles/state_manager_communications_genlisp.dir/depend

