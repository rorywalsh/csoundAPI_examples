cmake_minimum_required(VERSION 2.8.12)
project(CsoundAPIExamples)
# Release or Debug
set(CMAKE_BUILD_TYPE "Release")

# switch RPATH use off
set(CMAKE_MACOSX_RPATH 0)
# force make to print the command lines
set(CMAKE_VERBOSE_MAKEFILE on)
# path to Csound cmake module
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH}
"${CMAKE_SOURCE_DIR}/cmake/Modules/")
# set C++ compilation flags

set(CMAKE_CXX_FLAGS  ${CMAKE_CXX_FLAGS}  "-std=c++11")

add_executable(SetChannelExample ${CMAKE_CURRENT_SOURCE_DIR}/SetChannelExample.cpp)

function(make_app appName srcs)
  
  target_link_libraries(${appName} ${CSOUND_LIB})
  target_include_directories(${appName} PRIVATE ${CSOUND_INCLUDE_DIRS})
endfunction(make_app)

make_app(SetChannelExample, ${CMAKE_CURRENT_SOURCE_DIR}/SetChannelExample.cpp)

