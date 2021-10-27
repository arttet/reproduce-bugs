cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

project(reproduce-bugs VERSION 0.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Build types
include(CMakePrintHelpers)

cmake_print_variables(CMAKE_CONFIGURATION_TYPES)
cmake_print_variables(CMAKE_BUILD_TYPE)
cmake_print_variables(BUILD_SHARED_LIBS)

cmake_print_variables(CMAKE_CXX_FLAGS_DEBUG)
cmake_print_variables(CMAKE_CXX_FLAGS_RELEASE)

find_package(Git)
if (GIT_FOUND)
  execute_process(
    COMMAND ${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD
    RESULT_VARIABLE result
    OUTPUT_VARIABLE output
  )
  string(REGEX REPLACE "\n$" "" output "${output}")
  include(CMakePrintHelpers)
  cmake_print_variables(output)
endif (GIT_FOUND)

set(CMAKE_CXX_FLAGS_RELEASE "-MT")

if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  add_compile_options(
    "-Wall"
    "-Wextra"
    # "-Werror"
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

find_package(fmt REQUIRED)
find_package(Microsoft.GSL REQUIRED)

add_subdirectory(src)
