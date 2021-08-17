#!/usr/bin/env bash

conan install . --install-folder build --build=outdated -s arch_target=x86_64 -s build_type=Debug -s compiler.cppstd=17 -s compiler.version=12 -s compiler=clang -s compiler.libcxx=libstdc++11 -e CC=clang -e CXX=clang++ -e CONAN_CMAKE_GENERATOR=Ninja
conan build . --build-folder build
