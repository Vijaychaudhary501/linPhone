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
include CMakeFiles/mscodec2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mscodec2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mscodec2.dir/flags.make

CMakeFiles/mscodec2.dir/mscodec2.c.o: CMakeFiles/mscodec2.dir/flags.make
CMakeFiles/mscodec2.dir/mscodec2.c.o: mscodec2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/mscodec2.dir/mscodec2.c.o"
	/Applications/Xcode/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang --target=armv7-apple-darwin $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/mscodec2.dir/mscodec2.c.o   -c /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/mscodec2.c

CMakeFiles/mscodec2.dir/mscodec2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mscodec2.dir/mscodec2.c.i"
	/Applications/Xcode/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang --target=armv7-apple-darwin $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/mscodec2.c > CMakeFiles/mscodec2.dir/mscodec2.c.i

CMakeFiles/mscodec2.dir/mscodec2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mscodec2.dir/mscodec2.c.s"
	/Applications/Xcode/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang --target=armv7-apple-darwin $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/mscodec2.c -o CMakeFiles/mscodec2.dir/mscodec2.c.s

CMakeFiles/mscodec2.dir/mscodec2.c.o.requires:

.PHONY : CMakeFiles/mscodec2.dir/mscodec2.c.o.requires

CMakeFiles/mscodec2.dir/mscodec2.c.o.provides: CMakeFiles/mscodec2.dir/mscodec2.c.o.requires
	$(MAKE) -f CMakeFiles/mscodec2.dir/build.make CMakeFiles/mscodec2.dir/mscodec2.c.o.provides.build
.PHONY : CMakeFiles/mscodec2.dir/mscodec2.c.o.provides

CMakeFiles/mscodec2.dir/mscodec2.c.o.provides.build: CMakeFiles/mscodec2.dir/mscodec2.c.o


# Object files for target mscodec2
mscodec2_OBJECTS = \
"CMakeFiles/mscodec2.dir/mscodec2.c.o"

# External object files for target mscodec2
mscodec2_EXTERNAL_OBJECTS =

mscodec2.framework/mscodec2: CMakeFiles/mscodec2.dir/mscodec2.c.o
mscodec2.framework/mscodec2: CMakeFiles/mscodec2.dir/build.make
mscodec2.framework/mscodec2: CMakeFiles/mscodec2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library mscodec2.framework/mscodec2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mscodec2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mscodec2.dir/build: mscodec2.framework/mscodec2

.PHONY : CMakeFiles/mscodec2.dir/build

CMakeFiles/mscodec2.dir/requires: CMakeFiles/mscodec2.dir/mscodec2.c.o.requires

.PHONY : CMakeFiles/mscodec2.dir/requires

CMakeFiles/mscodec2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mscodec2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mscodec2.dir/clean

CMakeFiles/mscodec2.dir/depend:
	cd /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/cmake-builder/cmake/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/cmake-builder/cmake/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-armv7/Build/dummy_libraries/CMakeFiles/mscodec2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mscodec2.dir/depend

