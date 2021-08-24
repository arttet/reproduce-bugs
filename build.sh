#!/usr/bin/env bash

# Visual Studio
conan install . -g cmake -if build -b outdated \
    -s build_type=Debug -s arch_target=x86_64 -s compiler.cppstd=17 \
    -s compiler.version=19.29 -s compiler=msvc \
    -s compiler.runtime=dynamic -s compiler.runtime_type=Debug \
    -e CONAN_CMAKE_GENERATOR=Ninja
conan build . --build-folder build
