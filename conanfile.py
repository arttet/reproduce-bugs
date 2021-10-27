from conan.tools.cmake import CMake
from conans import ConanFile


class ReproduceBugsConan(ConanFile):
    name = "reproduce-bugs"
    version = "0.0.0"

    # Optional metadata
    license = "MIT"
    author = "Artyom Tetyukhin"
    url = "https://github.com/arttet/reproduce-bugs"
    description = "If you can reproduce a bug, you can fix It"
    topics = ("cpp", "bugs")

    # Binary configuration
    generators = "CMakeDeps", "CMakeToolchain"
    build_policy = "missing"
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False], "fPIC": [True, False]}
    default_options = {"shared": False, "fPIC": True}

    def config_options(self):
        if self.settings.os == "Windows":
            del self.options.fPIC

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
