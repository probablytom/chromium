# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/probablytom/chromium-gh/freebsd-ports"
  "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-build"
  "/home/probablytom/chromium-gh/freebsd-ports-prefix"
  "/home/probablytom/chromium-gh/freebsd-ports-prefix/tmp"
  "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp"
  "/home/probablytom/chromium-gh/freebsd-ports-prefix/src"
  "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/probablytom/chromium-gh/freebsd-ports-prefix/src/freebsd-ports-stamp${cfgdir}") # cfgdir has leading slash
endif()
