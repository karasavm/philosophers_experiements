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

# Utility rule file for dining_philosopher_communications_gencpp.

# Include the progress variables for this target.
include dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp.dir/progress.make

dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp:

dining_philosopher_communications_gencpp: dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp
dining_philosopher_communications_gencpp: dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp.dir/build.make
.PHONY : dining_philosopher_communications_gencpp

# Rule to build all files generated by this target.
dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp.dir/build: dining_philosopher_communications_gencpp
.PHONY : dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp.dir/build

dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp.dir/clean:
	cd /home/mike/philosophers_experiments/philosophers/build/dining_philosopher_communications && $(CMAKE_COMMAND) -P CMakeFiles/dining_philosopher_communications_gencpp.dir/cmake_clean.cmake
.PHONY : dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp.dir/clean

dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp.dir/depend:
	cd /home/mike/philosophers_experiments/philosophers/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mike/philosophers_experiments/philosophers/src /home/mike/philosophers_experiments/philosophers/src/dining_philosopher_communications /home/mike/philosophers_experiments/philosophers/build /home/mike/philosophers_experiments/philosophers/build/dining_philosopher_communications /home/mike/philosophers_experiments/philosophers/build/dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dining_philosopher_communications/CMakeFiles/dining_philosopher_communications_gencpp.dir/depend

