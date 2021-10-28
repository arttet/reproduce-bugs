#!/usr/bin/env bash

# Visual Studio
conan install . -if build --build outdated -pr .conan/profiles/profile -pr:b .conan/profiles/profile

conan build . -bf build
