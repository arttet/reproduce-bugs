cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

project(reproduce-bugs VERSION 0.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CXX_STANDARD_REQUIRED YES)
set(CXX_EXTENSIONS OFF)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

if ((CMAKE_CXX_COMPILER_ID STREQUAL "Clang") OR (CMAKE_CXX_COMPILER_ID STREQUAL "GNU"))
  add_compile_options(
    "-Wextra"
    "-Wall"
    "-Werror"

    "-fsanitize=memory"
    "-fno-omit-frame-pointer"
    "-fno-optimize-sibling-calls"

    "-stdlib=libc++"
    "-v"
  )

  add_link_options(
    "-fsanitize=memory"
    "-stdlib=libc++"
    "-lc++abi"
  )
endif()


add_subdirectory(src)
