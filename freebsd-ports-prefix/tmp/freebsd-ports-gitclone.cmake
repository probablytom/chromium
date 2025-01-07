# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if(EXISTS "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp/freebsd-ports-gitclone-lastrun.txt" AND EXISTS "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp/freebsd-ports-gitinfo.txt" AND
  "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp/freebsd-ports-gitclone-lastrun.txt" IS_NEWER_THAN "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp/freebsd-ports-gitinfo.txt")
  message(STATUS
    "Avoiding repeated git clone, stamp file is up to date: "
    "'/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp/freebsd-ports-gitclone-lastrun.txt'"
  )
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/home/probablytom/chromium-gh/freebsd-ports"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/probablytom/chromium-gh/freebsd-ports'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/local64/bin/git" 
            clone --no-checkout --progress --config "advice.detachedHead=false" "https://github.com/freebsd/freebsd-ports.git" "freebsd-ports"
    WORKING_DIRECTORY "/home/probablytom/chromium-gh"
    RESULT_VARIABLE error_code
  )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once: ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/freebsd/freebsd-ports.git'")
endif()

execute_process(
  COMMAND "/usr/local64/bin/git" 
          checkout "4b35fdbd99dd03b971c420a62bd44b48c98a224f" --
  WORKING_DIRECTORY "/home/probablytom/chromium-gh/freebsd-ports"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '4b35fdbd99dd03b971c420a62bd44b48c98a224f'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/local64/bin/git" 
            submodule update --recursive --init 
    WORKING_DIRECTORY "/home/probablytom/chromium-gh/freebsd-ports"
    RESULT_VARIABLE error_code
  )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/probablytom/chromium-gh/freebsd-ports'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp/freebsd-ports-gitinfo.txt" "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp/freebsd-ports-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp/freebsd-ports-gitclone-lastrun.txt'")
endif()
