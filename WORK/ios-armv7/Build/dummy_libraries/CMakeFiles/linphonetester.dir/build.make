# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.10.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.10.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/cmake-builder/cmake/dummy_libraries

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries

# Include any dependencies generated for this target.
include CMakeFiles/linphonetester.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/linphonetester.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/linphonetester.dir/flags.make

CMakeFiles/linphonetester.dir/linphonetester.c.o: CMakeFiles/linphonetester.dir/flags.make
CMakeFiles/linphonetester.dir/linphonetester.c.o: linphonetester.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/linphonetester.dir/linphonetester.c.o"
	/Applications/Xcode/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang --target=armv7-apple-darwin $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/linphonetester.dir/linphonetester.c.o   -c /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/linphonetester.c

CMakeFiles/linphonetester.dir/linphonetester.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/linphonetester.dir/linphonetester.c.i"
	/Applications/Xcode/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang --target=armv7-apple-darwin $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/linphonetester.c > CMakeFiles/linphonetester.dir/linphonetester.c.i

CMakeFiles/linphonetester.dir/linphonetester.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/linphonetester.dir/linphonetester.c.s"
	/Applications/Xcode/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang --target=armv7-apple-darwin $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/linphonetester.c -o CMakeFiles/linphonetester.dir/linphonetester.c.s

CMakeFiles/linphonetester.dir/linphonetester.c.o.requires:

.PHONY : CMakeFiles/linphonetester.dir/linphonetester.c.o.requires

CMakeFiles/linphonetester.dir/linphonetester.c.o.provides: CMakeFiles/linphonetester.dir/linphonetester.c.o.requires
	$(MAKE) -f CMakeFiles/linphonetester.dir/build.make CMakeFiles/linphonetester.dir/linphonetester.c.o.provides.build
.PHONY : CMakeFiles/linphonetester.dir/linphonetester.c.o.provides

CMakeFiles/linphonetester.dir/linphonetester.c.o.provides.build: CMakeFiles/linphonetester.dir/linphonetester.c.o


# Object files for target linphonetester
linphonetester_OBJECTS = \
"CMakeFiles/linphonetester.dir/linphonetester.c.o"

# External object files for target linphonetester
linphonetester_EXTERNAL_OBJECTS =

linphonetester.framework/linphonetester: CMakeFiles/linphonetester.dir/linphonetester.c.o
linphonetester.framework/linphonetester: CMakeFiles/linphonetester.dir/build.make
linphonetester.framework/linphonetester: CMakeFiles/linphonetester.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library linphonetester.framework/linphonetester"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/linphonetester.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/linphonetester.dir/build: linphonetester.framework/linphonetester

.PHONY : CMakeFiles/linphonetester.dir/build

CMakeFiles/linphonetester.dir/requires: CMakeFiles/linphonetester.dir/linphonetester.c.o.requires

.PHONY : CMakeFiles/linphonetester.dir/requires

CMakeFiles/linphonetester.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/linphonetester.dir/cmake_clean.cmake
.PHONY : CMakeFiles/linphonetester.dir/clean

CMakeFiles/linphonetester.dir/depend:
	cd /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/cmake-builder/cmake/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/cmake-builder/cmake/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/CMakeFiles/linphonetester.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/linphonetester.dir/depend

