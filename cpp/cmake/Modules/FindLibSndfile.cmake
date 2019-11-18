# Try to find the libsndfile library.
# Once done this will define:
#  LIBSNDFILE - System has the libsndfile library
#  LIBSNDFILE_INCLUDE_DIR - The libsndfile include directories.
#  LIBSNDFILE_LIBRARIES - The libraries needed to use the libsndfile library.

if(APPLE)
  find_path(LIBSNDFILE_INCLUDE_DIR libsndfile.h HINTS /usr/local/Cellar/libsndfile/1.0.28/include
  "/usr/local/Cellar/libsndfile/1.0.28/include")
elseif(WIN32)
  find_path(LIBSNDFILE_INCLUDE_DIR sndfile.h
            HINTS "C:\\Program Files\\Mega-Nerd\\libsndfile\\include")
else()
  find_path(LIBSNDFILE_INCLUDE_DIR libsndfile.h PATH_SUFFIXES libsndfile)
endif()

if(APPLE)
  find_library(LIBSNDFILE_LIBRARY NAMES libsndfile HINTS "/usr/local/Cellar/libsndfile/1.0.28/lib")
elseif(WIN32)
  find_library(LIBSNDFILE_LIBRARY NAMES sndfile libsndfile-1 libsndfile HINTS "C:\\Program Files\\Mega-Nerd\\libsndfile\\lib")
else()
  find_library(LIBSNDFILE_LIBRARY NAMES sndfile libsndfile-1 libsndfile)
endif()

include(FindPackageHandleStandardArgs)
# # handle the QUIETLY and REQUIRED arguments and set LIBSNDFILE_FOUND to TRUE
# # if all listed variables are TRUE
find_package_handle_standard_args(LIBSNDFILE
                                  LIBSNDFILE_LIBRARY LIBSNDFILE_INCLUDE_DIR)
mark_as_advanced(LIBSNDFILE_INCLUDE_DIR LIBSNDFILE_LIBRARY)

set(LIBSNDFILE_INCLUDE_DIRS ${LIBSNDFILE_INCLUDE_DIR})
set(LIBSNDFILE_LIBRARIES ${LIBSNDFILE_LIBRARY} )
