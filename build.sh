#!/usr/bin/env bash

# Clang
conan install . -if build -b outdated -pr clang_profile -pr:b clang_profile
conan build . --build-folder build
