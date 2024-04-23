# Reproduce bugs

[![build](https://github.com/arttet/reproduce-bugs/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/arttet/reproduce-bugs/actions/workflows/build.yml)

If you can reproduce a bug, you can fix It

## Issue

https://github.com/conan-io/conan-center-index/issues/20511

```sh
.conan2/p/b/libfd81f141c9f151c/b/src/libSBRdec/src/lpp_tran.cpp:122:10: fatal error: 'log/log.h' file not found
#include "log/log.h"
         ^~~~~~~~~~~
```

## Workaround

https://github.com/mstorsjo/fdk-aac/issues/124


## CLI

```sh
$ make
▸▸▸ Development commands ◂◂◂
help:                   Show this help
deps:                   Install the dependencies
build:                  Build the project
install:                Create a package
clean:                  Remove generated artifacts
```
