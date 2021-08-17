#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from conans import ConanFile, CMake


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

    generators = "cmake", "cmake_find_package"
    build_policy = "missing"

    def config_options(self):
        if self.settings.os == "Windows":
            del self.options.fPIC

    def configure(self):
        pass

    def requirements(self):
        pass

    def package_id(self):
        pass

    def build_requirements(self):
        self.build_requires("gtest/1.11.0", force_host_context=True)

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
