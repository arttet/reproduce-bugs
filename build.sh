#!/usr/bin/env bash

# Visual Studio
conan install . -if build \
    -s build_type=Debug -s arch_target=x86_64 -s compiler.cppstd=17 \
    -s compiler.version=19.29 -s compiler=msvc \
    -s compiler.runtime=dynamic -s compiler.runtime_type=Debug \
    -c tools.cmake.cmaketoolchain:generator=Ninja

conan build . -bf build
