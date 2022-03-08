#!/bin/bash

set -exuo pipefail

mkdir -p build
cd build

# regarding ABSL_PROPAGATE_CXX_STD:
# enforce consuming libraries to compile using at least the same C++ standard, see
# patches/0006-propagate-requirement-of-C-17-to-consumers.patch as well as
# https://github.com/abseil/abseil-cpp/blob/20211102.0/CMake/AbseilHelpers.cmake#L257-L273
cmake ${CMAKE_ARGS} \
    -DABSL_PROPAGATE_CXX_STD=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${cxx_standard} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_PREFIX_PATH=${PREFIX} \
    -GNinja \
    ..

ninja install
