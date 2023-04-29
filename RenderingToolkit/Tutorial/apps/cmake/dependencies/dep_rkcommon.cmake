## Copyright 2009 Intel Corporation
## SPDX-License-Identifier: Apache-2.0

set(COMPONENT_NAME rkcommon)

set(COMPONENT_PATH ${INSTALL_DIR_ABSOLUTE})
if (INSTALL_IN_SEPARATE_DIRECTORIES)
  set(COMPONENT_PATH ${INSTALL_DIR_ABSOLUTE}/${COMPONENT_NAME})
endif()

if (RKCOMMON_HASH)
  set(RKCOMMON_URL_HASH URL_HASH SHA256=${RKCOMMON_HASH})
endif()

string(REGEX REPLACE "(^[0-9]+\.[0-9]+\.[0-9]+$)" "v\\1" RKCOMMON_ARCHIVE ${RKCOMMON_VERSION})
set(RKCOMMON_URL "https://github.com/ospray/rkcommon/archive/${RKCOMMON_ARCHIVE}.zip"
  CACHE STRING "Location to get rkcommon source from")
if (${RKCOMMON_URL} MATCHES ".*\.zip$")
  set(RKCOMMON_CLONE_URL URL ${RKCOMMON_URL})
else()
  set(RKCOMMON_CLONE_URL GIT_REPOSITORY ${RKCOMMON_URL} GIT_TAG ${RKCOMMON_VERSION})
endif()

ExternalProject_Add(${COMPONENT_NAME}
  PREFIX ${COMPONENT_NAME}
  DOWNLOAD_DIR ${COMPONENT_NAME}
  STAMP_DIR ${COMPONENT_NAME}/stamp
  SOURCE_DIR ${COMPONENT_NAME}/src
  BINARY_DIR ${COMPONENT_NAME}/build
  LIST_SEPARATOR |
  ${RKCOMMON_CLONE_URL}
  ${RKCOMMON_URL_HASH}
  CMAKE_ARGS
    -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
    -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
    -DCMAKE_INSTALL_PREFIX:PATH=${COMPONENT_PATH}
    -DCMAKE_INSTALL_INCLUDEDIR=${CMAKE_INSTALL_INCLUDEDIR}
    -DCMAKE_INSTALL_LIBDIR=${CMAKE_INSTALL_LIBDIR}
    -DCMAKE_INSTALL_DOCDIR=${CMAKE_INSTALL_DOCDIR}
    -DCMAKE_INSTALL_BINDIR=${CMAKE_INSTALL_BINDIR}
    -DCMAKE_BUILD_TYPE=${DEPENDENCIES_BUILD_TYPE}
    -DINSTALL_DEPS=OFF
    -DBUILD_TESTING=OFF
    $<$<BOOL:${DOWNLOAD_TBB}>:-DRKCOMMON_TBB_ROOT=${TBB_PATH}>
    -DCMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
    -DCMAKE_OSX_DEPLOYMENT_TARGET=${CMAKE_OSX_DEPLOYMENT_TARGET}
  BUILD_COMMAND ${DEFAULT_BUILD_COMMAND}
  BUILD_ALWAYS ${ALWAYS_REBUILD}
)
ExternalProject_Add_StepTargets(${COMPONENT_NAME} NO_DEPENDS download)

list(APPEND CMAKE_PREFIX_PATH ${COMPONENT_PATH})
string(REPLACE ";" "|" CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH}")

if (DOWNLOAD_TBB)
  ExternalProject_Add_StepDependencies(${COMPONENT_NAME} configure tbb)
endif()