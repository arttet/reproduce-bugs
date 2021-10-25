#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from conans import ConanFile
from conan.tools.cmake import CMake


class UtilsConan(ConanFile):
    name = "reproduce-bugs"
    version = "0.0.0"
    description = "If you can reproduce a bug, you can fix It"
    homepage = "https://github.com/arttet/reproduce-bugs"
    license = "MIT"
    author = "Artyom Tetyukhin"
    settings = "os", "arch", "compiler", "build_type"

    options = {
        "shared": [True, False],
        "fPIC": [True, False],
    }

    default_options = {
        "shared": False,
        "fPIC": True,
    }

    generators = "CMakeDeps", "CMakeToolchain"
    build_policy = "missing"

    def config_options(self):
        if self.settings.os == "Windows":
            del self.options.fPIC

    def configure(self):
        pass

    def requirements(self):
        self.requires("fmt/8.0.1")

    def package_id(self):
        pass

    def build_requirements(self):
        pass

    def build_id(self):
        pass

    def system_requirements(self):
        pass

    def source(self):
        pass

    def imports(self):
        pass

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        pass

    def package_info(self):
        pass

    def deploy(self):
        pass
