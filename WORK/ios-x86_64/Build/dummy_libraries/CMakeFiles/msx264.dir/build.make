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
CMAKE_BINARY_DIR = /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries

# Include any dependencies generated for this target.
include CMakeFiles/msx264.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/msx264.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/msx264.dir/flags.make

CMakeFiles/msx264.dir/msx264.c.o: CMakeFiles/msx264.dir/flags.make
CMakeFiles/msx264.dir/msx264.c.o: msx264.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/msx264.dir/msx264.c.o"
	/Applications/Xcode/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang --target=x86_64-apple-darwin $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/msx264.dir/msx264.c.o   -c /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries/msx264.c

CMakeFiles/msx264.dir/msx264.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/msx264.dir/msx264.c.i"
	/Applications/Xcode/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang --target=x86_64-apple-darwin $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries/msx264.c > CMakeFiles/msx264.dir/msx264.c.i

CMakeFiles/msx264.dir/msx264.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/msx264.dir/msx264.c.s"
	/Applications/Xcode/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang --target=x86_64-apple-darwin $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries/msx264.c -o CMakeFiles/msx264.dir/msx264.c.s

CMakeFiles/msx264.dir/msx264.c.o.requires:

.PHONY : CMakeFiles/msx264.dir/msx264.c.o.requires

CMakeFiles/msx264.dir/msx264.c.o.provides: CMakeFiles/msx264.dir/msx264.c.o.requires
	$(MAKE) -f CMakeFiles/msx264.dir/build.make CMakeFiles/msx264.dir/msx264.c.o.provides.build
.PHONY : CMakeFiles/msx264.dir/msx264.c.o.provides

CMakeFiles/msx264.dir/msx264.c.o.provides.build: CMakeFiles/msx264.dir/msx264.c.o


# Object files for target msx264
msx264_OBJECTS = \
"CMakeFiles/msx264.dir/msx264.c.o"

# External object files for target msx264
msx264_EXTERNAL_OBJECTS =

msx264.framework/msx264: CMakeFiles/msx264.dir/msx264.c.o
msx264.framework/msx264: CMakeFiles/msx264.dir/build.make
msx264.framework/msx264: CMakeFiles/msx264.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library msx264.framework/msx264"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/msx264.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/msx264.dir/build: msx264.framework/msx264

.PHONY : CMakeFiles/msx264.dir/build

CMakeFiles/msx264.dir/requires: CMakeFiles/msx264.dir/msx264.c.o.requires

.PHONY : CMakeFiles/msx264.dir/requires

CMakeFiles/msx264.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/msx264.dir/cmake_clean.cmake
.PHONY : CMakeFiles/msx264.dir/clean

CMakeFiles/msx264.dir/depend:
	cd /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/cmake-builder/cmake/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/cmake-builder/cmake/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-x86_64/Build/dummy_libraries/CMakeFiles/msx264.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/msx264.dir/depend

