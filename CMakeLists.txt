cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

project(reproduce-bugs VERSION 0.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CXX_STANDARD_REQUIRED YES)
set(CXX_EXTENSIONS OFF)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

find_package(GTest REQUIRED)

if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  if (CMAKE_CXX_COMPILER_FRONTEND_VARIANT STREQUAL "MSVC")
    # using clang with clang-cl front end
  elseif (CMAKE_CXX_COMPILER_FRONTEND_VARIANT STREQUAL "GNU")
    # using clang with regular front end
  endif()
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
