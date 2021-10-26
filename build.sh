#!/usr/bin/env bash

set -euo pipefail

conan install . -if build --build outdated \
    -pr .profile/clang_x86_64_asan \
    -pr:b .profile/clang_x86_64_asan \
    -e CONAN_CMAKE_GENERATOR=Ninja \
    -c tools.cmake.cmaketoolchain:generator=Ninja

conan build . -bf build
