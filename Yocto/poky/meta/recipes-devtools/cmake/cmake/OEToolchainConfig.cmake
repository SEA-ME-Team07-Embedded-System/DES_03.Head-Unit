set( CMAKE_SYSTEM_NAME Linux )
set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )

set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )

set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX}")

set( CMAKE_SYSTEM_PROCESSOR $ENV{OECORE_TARGET_ARCH} )

# Include the toolchain configuration subscripts
file( GLOB toolchain_config_files "${CMAKE_CURRENT_LIST_FILE}.d/*.cmake" )
foreach(config ${toolchain_config_files})
    include(${config})
endforeach()
