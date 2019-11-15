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



if(APPLE)

else()
  if(NOT CSOUND_INCLUDE_DIR)
    set(CSOUND_INCLUDE_DIR  "C:/Program Files/Csound6_x64/include/csound")
  endif()
  if(NOT CSOUND_LIB)
    set(CSOUND_LIB  "C:/Program Files/Csound6_x64/lib/csound64.lib")
  endif()
  if(NOT LIBSNDFILE_INCLUDE_DIR)
    set(LIBSNDFILE_INCLUDE_DIR "C:/Program Files/Mega-Nerd/libsndfile/include")
  endif()
  if(NOT LIBSNDFILE_LIB)
    set(LIBSNDFILE_LIB "C:/Program Files/Mega-Nerd/libsndfile/lib/libsndfile-1.lib")
  endif()
endif()


function(make_api_app appName srcs)
  message("${srcs}")
  add_executable(${appName} ${srcs})
  if(APPLE)

  else()
  target_link_libraries(${appName} ${CSOUND_LIB} ${LIBSNDFILE_LIB})
  target_include_directories(${appName} PRIVATE ${CSOUND_INCLUDE_DIR} ${LIBSNDFILE_INCLUDE_DIR})
  endif()
endfunction(make_app)

make_api_app(SetChannelExample "${CMAKE_CURRENT_SOURCE_DIR}/SetChannelExample.cpp;${CSOUND_INCLUDE_DIR}/csPerfThread.cpp" )
make_api_app(csPerfThreadExample "${CMAKE_CURRENT_SOURCE_DIR}/csPerfThreadExample.cpp;${CSOUND_INCLUDE_DIR}/csPerfThread.cpp" )
make_api_app(CsoundMessageBuffer "${CMAKE_CURRENT_SOURCE_DIR}/CsoundMessageBuffer.cpp")
make_api_app(GenerativeScoreExample "${CMAKE_CURRENT_SOURCE_DIR}/GenerativeScoreExample.cpp;${CSOUND_INCLUDE_DIR}/csPerfThread.cpp")
make_api_app(GetSpoutExample "${CMAKE_CURRENT_SOURCE_DIR}/GetSpoutExample.cpp")
make_api_app(GetStringChannelExample "${CMAKE_CURRENT_SOURCE_DIR}/GetStringChannelExample.cpp")
make_api_app(SimpleCsdPlayback "${CMAKE_CURRENT_SOURCE_DIR}/SimpleCsdPlayback.cpp")
make_api_app(SimpleCsdTextPlayback "${CMAKE_CURRENT_SOURCE_DIR}/SimpleCsdTextPlayback.cpp")
make_api_app(StringOrcScoPlayback "${CMAKE_CURRENT_SOURCE_DIR}/StringOrcScoPlayback.cpp")
make_api_app(DummyCsThread "${CMAKE_CURRENT_SOURCE_DIR}/DummyCsThread.cpp;${CSOUND_INCLUDE_DIR}/csPerfThread.cpp")
make_api_app(DummyNonCsThread "${CMAKE_CURRENT_SOURCE_DIR}/DummyNonCsThread.cpp")





