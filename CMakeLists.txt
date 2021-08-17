cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

project(reproduce-bug VERSION 0.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CXX_STANDARD_REQUIRED YES)
set(CXX_EXTENSIONS OFF)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

if ((CMAKE_CXX_COMPILER_ID STREQUAL "Clang") OR (CMAKE_CXX_COMPILER_ID STREQUAL "GNU"))
  add_compile_options(
    "-Wextra"
    "-Wall"
    "-Werror"
  )
endif()

if (MSVC)
  add_compile_options(
    "/WX"
    "/W4"
    "/EHsc"
  )

  add_compile_definitions(_SCL_SECURE_NO_WARNINGS)
endif ()

add_subdirectory(src)
