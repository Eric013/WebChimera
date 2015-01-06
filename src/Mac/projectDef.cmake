#/**********************************************************\
# Auto-generated Mac project definition file for the
# WebChimera Plugin project
#\**********************************************************/

# Mac template platform definition CMake file
# Included from ../CMakeLists.txt

set( QTDIR ${_qt5Core_install_prefix} )

add_subdirectory( ${DEPS_DIR}/QuickLayer "${DEPS_BINARY_DIR}/QuickLayer" )

# remember that the current source dir is the project root; this file is in Mac/
file( GLOB PLATFORM RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    Mac/[^.]*.cpp
    Mac/[^.]*.mm
    Mac/[^.]*.h
    Mac/[^.]*.cmake
    )

set( VLC_PATH "${DEPS_DIR}/VLC-${VLC_VERSION}.app/Contents/MacOS" )

file( GLOB LIBVLC_LIB ${VLC_PATH}/lib/[^.]*.dylib )
file( GLOB LIBVLC_PLUGINS ${VLC_PATH}/plugins/[^.]*.dylib )
file( GLOB LIBVLC_LUA_EXTENSIONS ${VLC_PATH}/share/lua/extensions/[^.]*.luac )
file( GLOB LIBVLC_LUA_MODULES ${VLC_PATH}/share/lua/modules/[^.]*.luac )
file( GLOB LIBVLC_LUA_PLAYLIST ${VLC_PATH}/share/lua/playlist/[^.]*.luac )

set( LIBVLC
    ${LIBVLC_LIB}
    ${LIBVLC_PLUGINS}
    ${LIBVLC_LUA_EXTENSIONS}
    ${LIBVLC_LUA_MODULES}
    ${LIBVLC_LUA_PLAYLIST}
    )

source_group( Libvlc FILES ${LIBVLC} )

set_source_files_properties(
    ${LIBVLC_LIB}
    PROPERTIES
    MACOSX_PACKAGE_LOCATION MacOS/lib
    )

set_source_files_properties(
    ${LIBVLC_PLUGINS}
    PROPERTIES
    MACOSX_PACKAGE_LOCATION MacOS/plugins
    )

set_source_files_properties(
    ${LIBVLC_LUA_EXTENSIONS}
    PROPERTIES
    MACOSX_PACKAGE_LOCATION MacOS/share/lua/extensions/
    )

set_source_files_properties(
    ${LIBVLC_LUA_MODULES}
    PROPERTIES
    MACOSX_PACKAGE_LOCATION MacOS/share/lua/modules/
    )

set_source_files_properties(
    ${LIBVLC_LUA_PLAYLIST}
    PROPERTIES
    MACOSX_PACKAGE_LOCATION MacOS/share/lua/playlist/
    )

source_group( Mac FILES ${PLATFORM} )

set( SOURCES
    ${SOURCES}
    ${PLATFORM}
    ${LIBVLC}
    )

include_directories(
    ${VLC_PATH}/include
    ${QTDIR}/include
    )

# use this to add preprocessor definitions
add_definitions(
)

set( PLIST "Mac/bundle_template/Info.plist" )
set( STRINGS "Mac/bundle_template/InfoPlist.strings" )
set( LOCALIZED "Mac/bundle_template/Localized.r" )

add_mac_plugin( ${PROJECT_NAME} ${PLIST} ${STRINGS} ${LOCALIZED} SOURCES )

# add library dependencies here; leave ${PLUGIN_INTERNAL_DEPS} there unless you know what you're doing!
target_link_libraries( ${PROJECT_NAME}
    ${PLUGIN_INTERNAL_DEPS}
    ${Qt5Gui_EGL_LIBRARIES}
    ${Qt5Gui_OPENGL_LIBRARIES}
    ${VLC_PATH}/lib/libvlc.dylib
    QuickLayer
    )

#To create a DMG, include the following file
#include( Mac/installer.cmake )
