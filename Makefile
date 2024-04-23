CONAN_VERSION_SHORT:=$(shell echo `conan --version` | sed -E 's/.* go(.*) .*/\1/g')
ifneq ("2","$(shell printf "$(CONAN_VERSION_SHORT)\n2" | sort -V | head -1)")
$(warning NEED CONAN VERSION >= 2. Found: $(CONAN_VERSION_SHORT))
endif

#######################################################################################################################

BUILD_DIR ?= build
BUILD_TYPE ?= Debug

PROFILE_HOST ?= .conan2/profiles/x86_64-unknown-linux-gnu
PROFILE_BUILD ?= .conan2/profiles/x86_64-unknown-linux-gnu

CONAN_INSTALL_EXTRA_ARGS ?=
CONAN_BUILD_EXTRA_ARGS ?=
CONAN_CREATE_EXTRA_ARGS ?=

CLANG_FORMAT_FILE_TEMPLATE ?= \( \
		-name "*.c" -o \
		-name "*.cpp" -o \
		-name "*.h" -o \
		-name "*.hpp" \
	\)

#######################################################################################################################

# NOTE: use Makefile.local for customization
-include Makefile.local

#######################################################################################################################

## ▸▸▸ Development commands ◂◂◂

.PHONY: help
help:			## Show this help
	@fgrep -h "## " $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/## //'

.PHONY: fmt
fmt:	## Format code
	@find . ${CLANG_FORMAT_FILE_TEMPLATE} | xargs clang-format -i

.PHONY: deps
deps:			## Install the dependencies
	conan install -of ${BUILD_DIR} -pr:h ${PROFILE_HOST} -pr:b ${PROFILE_BUILD} -s build_type=${BUILD_TYPE} ${CONAN_INSTALL_EXTRA_ARGS} .

.PHONY: build
build:			## Build the project
	conan build -of ${BUILD_DIR} -pr:h ${PROFILE_HOST} -pr:b ${PROFILE_BUILD} -s build_type=${BUILD_TYPE} ${CONAN_BUILD_EXTRA_ARGS} .

.PHONY: install
install:		## Create a package
	conan create -pr:h ${PROFILE_HOST} -pr:b ${PROFILE_BUILD} -s build_type=${BUILD_TYPE} ${CONAN_CREATE_EXTRA_ARGS} .

.PHONY: clean
clean:			## Remove generated artifacts
	@rm -rf ./build
	conan cache clean "*"

#######################################################################################################################
