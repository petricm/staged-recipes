#!/usr/bin/env bash

mkdir build && cd build

cmake \
    -DBUILD_ROOTDICT=ON
    -DCMAKE_BUILD_TYPE=Release \
    -LAH \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    ../source

cmake --build . --target install -j${CPU_COUNT}
