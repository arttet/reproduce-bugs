#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, CMake, cmake_layout, CMakeDeps


class ReproduceBugsRecipe(ConanFile):
    name = "reproduce-bugs"
    version = "0.2.0"
    package_type = "application"

    # Optional metadata
    license = "MIT"
    author = "Artyom Tetyukhin"
    url = "https://github.com/arttet/reproduce-bugs"
    description = "If you can reproduce a bug, you can fix it"
    topics = ("cpp", "bugs")

    # Binary configuration
    settings = "os", "compiler", "build_type", "arch"

    options = {"shared": [True, False], "fPIC": [True, False]}
    default_options = {"shared": False, "fPIC": True}

    # Sources are located in the same place as this recipe, copy them to the recipe
    exports_sources = "CMakeLists.txt", "src/*"

    def config_options(self):
        if self.settings.os == "Windows":
            self.options.rm_safe("fPIC")

    def configure(self):
        if self.options.shared:
            self.options.rm_safe("fPIC")

    def requirements(self):
        self.requires("ffmpeg/6.1")

    def build_requirements(self):
        pass

    def layout(self):
        cmake_layout(self)

    def generate(self):
        deps = CMakeDeps(self)
        deps.generate()
        tc = CMakeToolchain(self)
        tc.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()
