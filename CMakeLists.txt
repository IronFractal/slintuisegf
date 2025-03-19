# @file CMakeLists.txt
# @author James Hatfield
# @date 2025-03-18
# SPDX-License-Identifier: MIT
cmake_minimum_required(VERSION 3.21)
project(segf)

# Set the C++ standard to C++20 or later
set(CMAKE_CXX_STANDARD 20)

# Common Variables
set(SEGF_SRC_DIR ${CMAKE_SOURCE_DIR}/src)
set(SEGF_UI_SRC_DIR ${CMAKE_SOURCE_DIR}/ui_src)

# Set project source files
set(SEGF_SOURCE_FILES
    ${SEGF_SRC_DIR}/main.cpp
)

# Build into ./bin
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Use CPM to resolve dependencies
include(cmake/CPM.cmake)

# Add slint
CPMAddPackage(
    NAME slint
    VERSION 1.10.0
    SOURCE_SUBDIR api/cpp
    GITHUB_REPOSITORY slint-ui/slint
    URL_HASH SHA256=1c0b7e767640556db9e08e4c14f40ff2825a6f5459482a5f284106185972bda8
)

# executable
add_executable(segf ${SEGF_SOURCE_FILES})

# Add ui sources
slint_target_sources(segf
    ${SEGF_UI_SRC_DIR}/segf_win.slint
)

# Linking
target_link_libraries(segf PUBLIC
    Slint::Slint
)
