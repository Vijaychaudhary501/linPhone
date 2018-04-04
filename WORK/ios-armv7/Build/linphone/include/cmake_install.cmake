# Install script for directory: /Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/linphone" TYPE FILE MESSAGE_LAZY PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/account_creator.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/account_creator_service.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/address.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/auth_info.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/buffer.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/call.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/callbacks.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/call_log.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/call_params.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/call_stats.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/chat.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/conference.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/contactprovider.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/content.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/core.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/core_utils.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/defs.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/dictionary.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/error_info.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/event.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/factory.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/friend.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/friendlist.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/im_encryption_engine.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/im_notif_policy.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/info_message.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/ldapprovider.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/logging.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/lpconfig.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/misc.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/nat_policy.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/payload_type.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/player.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/presence.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/proxy_config.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/ringtoneplayer.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/sipsetup.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/tunnel.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/types.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/vcard.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/video_definition.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/wrapper_utils.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/xmlrpc.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/headers.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/linphonecore.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/linphonecore_utils.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/linphonefriend.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/linphonepresence.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/linphone_proxy_config.h"
    "/Users/vijaychaudhry/Desktop/SVN/Test/linphone-iphone/submodules/linphone/include/linphone/linphone_tunnel.h"
    )
endif()

