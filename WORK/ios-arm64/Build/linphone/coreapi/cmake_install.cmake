# Install script for directory: /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/coreapi

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/liblinphone-sdk/arm64-apple-darwin.ios")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/Frameworks" TYPE DIRECTORY MESSAGE_LAZY PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-arm64/Build/linphone/coreapi/linphone.framework" USE_SOURCE_PERMISSIONS)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/Frameworks/linphone.framework/linphone" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/Frameworks/linphone.framework/linphone")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/liblinphone-sdk/arm64-apple-darwin.ios/Frameworks"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/Frameworks/linphone.framework/linphone")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "@executable_path/../Frameworks"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/Frameworks/linphone.framework/linphone")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/WORK/ios-arm64/Build/linphone/coreapi/help/cmake_install.cmake")

endif()

