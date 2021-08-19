#!/usr/bin/env bash

#    -D CMAKE_CXX_FLAGS="-fsanitize=memory -fno-omit-frame-pointer -fno-optimize-sibling-calls -stdlib=libc++ -v" \
#    -D CMAKE_EXE_LINKER_FLAGS="-stdlib=libc++ -lc++abi" \

cmake \
    -D CMAKE_C_COMPILER=clang-14 \
    -D CMAKE_CXX_COMPILER=clang++-14 \
    -D CMAKE_BUILD_TYPE=Debug \
    -S . -B ./build/
cmake --build ./build/
