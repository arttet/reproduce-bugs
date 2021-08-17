#!/usr/bin/env bash

conan install . --install-folder build --build=outdated -s arch_target=x86_64 -s build_type=Debug -s compiler.cppstd=17 -s compiler.version=12 -s compiler=clang -s compiler.libcxx=libstdc++11 -e CC=clang-12 -e CXX=clang++-12 
conan build . --build-folder build
