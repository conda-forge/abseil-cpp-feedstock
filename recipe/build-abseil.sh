#!/bin/bash

set -exuo pipefail

mkdir -p build
cd build

cmake ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${cxx_standard} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_PREFIX_PATH=${PREFIX} \
    -DBUILD_SHARED_LIBS=${shared_libs} \
    -GNinja \
    ..

cmake --build .
cmake --install .
