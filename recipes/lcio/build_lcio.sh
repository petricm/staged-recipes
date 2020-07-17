#!/bin/bash
set -ex

mkdir -p build-dir
cd build-dir

CPU_COUNT=$(nproc)

cmake \
    -DCMAKE_CXX_STANDARD=${STANDARD}
    -DBUILD_ROOTDICT=ON
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH="${PREFIX}" \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_INSTALL_RPATH="${PREFIX}/lib" \
    -DCMAKE_INSTALL_NAME_DIR="${PREFIX}/lib" \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
    -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON \
    ../lcio-source

make "-j${CPU_COUNT}"
make install "-j${CPU_COUNT}"

# Clean up to minimise disk usage
cd ..
rm -rf build-dir
