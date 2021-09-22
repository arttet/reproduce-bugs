#!/usr/bin/env bash

# Clang
conan install . -g cmake -if build -b outdated \
    -s compiler.version=12 -s compiler=clang \
    -s compiler.libcxx=libstdc++11 -s compiler.runtime=MTd \
    -e CC=clang -e CXX=clang++ \
    -e CONAN_CMAKE_GENERATOR=Ninja

conan build . --build-folder build
