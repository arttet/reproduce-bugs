cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

project(reproduce-bugs VERSION 0.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  add_compile_options(
    "-Wall"
    "-Wextra"
  )

  add_compile_options(
    "-Wno-c++98-compat"
    "-Wno-c++98-compat-pedantic"
    "-Wno-unused-command-line-argument"
  )

  if (CMAKE_CXX_COMPILER_FRONTEND_VARIANT STREQUAL "MSVC")
    # Using clang with clang-cl front end
  elseif (CMAKE_CXX_COMPILER_FRONTEND_VARIANT STREQUAL "GNU")
    # Using clang with regular front end
    add_compile_options(
      "-Werror"
    )
  endif()
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

add_subdirectory(src)
