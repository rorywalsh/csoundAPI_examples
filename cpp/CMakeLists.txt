cmake_minimum_required(VERSION 2.8.12)
project(CsoundAPIExamples)
# Release or Debug
set(CMAKE_BUILD_TYPE "Release")
set(CMAKE_MACOSX_RPATH 0)
set(CMAKE_VERBOSE_MAKEFILE on)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
set(CMAKE_CXX_FLAGS  ${CMAKE_CXX_FLAGS}  "-std=c++11")

find_package(LibSndfile)
find_package(Csound)

function(make_api_app appName srcs)
  message("${srcs}")
  add_executable(${appName} ${srcs})
  target_link_libraries(${appName} ${CSOUND_LIBRARIES} ${LIBSNDFILE_LIBRARIES})
  target_include_directories(${appName} PRIVATE ${CSOUND_INCLUDE_DIR} ${LIBSNDFILE_INCLUDE_DIRS})
endfunction(make_app)

make_api_app(SetChannelExample "${CMAKE_CURRENT_SOURCE_DIR}/SetChannelExample.cpp;${CMAKE_CURRENT_SOURCE_DIR}/csPerfThread.cpp" )
make_api_app(csPerfThreadExample "${CMAKE_CURRENT_SOURCE_DIR}/csPerfThreadExample.cpp;${CMAKE_CURRENT_SOURCE_DIR}/csPerfThread.cpp" )
make_api_app(CsoundMessageBuffer "${CMAKE_CURRENT_SOURCE_DIR}/CsoundMessageBuffer.cpp")
make_api_app(GenerativeScoreExample "${CMAKE_CURRENT_SOURCE_DIR}/GenerativeScoreExample.cpp;${CMAKE_CURRENT_SOURCE_DIR}/csPerfThread.cpp")
make_api_app(GetSpoutExample "${CMAKE_CURRENT_SOURCE_DIR}/GetSpoutExample.cpp")
make_api_app(GetStringChannelExample "${CMAKE_CURRENT_SOURCE_DIR}/GetStringChannelExample.cpp")
make_api_app(SimpleCsdPlayback "${CMAKE_CURRENT_SOURCE_DIR}/SimpleCsdPlayback.cpp")
make_api_app(SimpleCsdTextPlayback "${CMAKE_CURRENT_SOURCE_DIR}/SimpleCsdTextPlayback.cpp")
make_api_app(StringOrcScoPlayback "${CMAKE_CURRENT_SOURCE_DIR}/StringOrcScoPlayback.cpp")
make_api_app(DummyCsThread "${CMAKE_CURRENT_SOURCE_DIR}/DummyCsThread.cpp;${CMAKE_CURRENT_SOURCE_DIR}/csPerfThread.cpp")
make_api_app(DummyNonCsThread "${CMAKE_CURRENT_SOURCE_DIR}/DummyNonCsThread.cpp")
