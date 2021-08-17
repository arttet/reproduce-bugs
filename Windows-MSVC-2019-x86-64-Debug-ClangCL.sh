#!/usr/bin/env bash

conan install . --install-folder build --build=outdated -s arch_target=x86_64 -s build_type=Debug -s compiler.cppstd=17 -s compiler.version=16 -s compiler="Visual Studio" -s compiler.toolset=ClangCL -s compiler.runtime=MTd -e CC=clang-cl -e CXX=clang-cl
conan build . --build-folder build
