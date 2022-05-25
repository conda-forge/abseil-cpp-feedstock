#!/bin/bash

set -exuo pipefail

mkdir -p build
cd build

cmake ${CMAKE_ARGS} \
    -DBUILD_SHARED_LIBS=${shared_libs} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${cxx_standard} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_PREFIX_PATH=${PREFIX} \
    -GNinja \
    ..

ninja install
