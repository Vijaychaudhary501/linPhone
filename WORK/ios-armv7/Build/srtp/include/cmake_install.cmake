# Install script for directory: /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/externals/srtp/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/liblinphone-sdk/armv7-apple-darwin.ios")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/srtp2" TYPE FILE MESSAGE_LAZY PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/externals/srtp/include/ekt.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/externals/srtp/include/getopt_s.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/externals/srtp/include/rtp.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/externals/srtp/include/rtp_priv.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/externals/srtp/include/srtp.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/externals/srtp/include/srtp_priv.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/externals/srtp/include/ut_sim.h"
    )
endif()

