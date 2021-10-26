#!/usr/bin/env bash

set -euo pipefail

conan install . -if build --build outdated \
    -s build_type=Release -pr .profile/clang_x86_64_mt \
    -s:b build_type=Release -pr:b .profile/clang_x86_64_mt \
    -e CONAN_CMAKE_GENERATOR=Ninja \
    -c tools.cmake.cmaketoolchain:generator=Ninja

conan build . -bf build
