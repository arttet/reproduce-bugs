cmake_minimum_required(VERSION 3.29 FATAL_ERROR)

project(reproduce-bugs VERSION 0.2.0 LANGUAGES C CXX)

############################################################################################

include(CMakePrintHelpers)

find_package(Git)

if (GIT_FOUND)
  execute_process(
    COMMAND ${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD
    RESULT_VARIABLE RESULT
    OUTPUT_VARIABLE GIT_BRANCH
  )

  string(REGEX REPLACE "\n$" "" GIT_BRANCH "${GIT_BRANCH}")
  cmake_print_variables(GIT_BRANCH)
endif (GIT_FOUND)

############################################################################################

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

cmake_print_variables(CMAKE_CXX_FLAGS)
cmake_print_variables(CMAKE_VERBOSE_MAKEFILE)

############################################################################################

if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  add_compile_options(
    "-Wall"
    "-Wextra"
    "-Werror"
  )

  add_compile_options(
    "-Wno-c++98-compat"
    "-Wno-c++98-compat-pedantic"
  )

  if (CMAKE_CXX_COMPILER_FRONTEND_VARIANT STREQUAL "MSVC")
    # Using clang with clang-cl front end
  elseif (CMAKE_CXX_COMPILER_FRONTEND_VARIANT STREQUAL "GNU")
    # Using clang with regular front end
  endif()
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  add_compile_options(
    "-Wall"
    "-Wextra"
    "-Werror"
  )
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  add_compile_definitions(
    _SCL_SECURE_NO_WARNINGS
  )

  add_compile_options(
    "/WX"
    "/W4"
    "/EHsc"
  )
endif()

############################################################################################

add_subdirectory(src)

############################################################################################
