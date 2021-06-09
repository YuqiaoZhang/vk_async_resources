#!/bin/bash

HERE="$(dirname "$(readlink -f "${0}")")"

"${HERE}/build_shader.sh"

mkdir -p "${HERE}/../build"
cd "${HERE}/../build"

cmake \
-DCMAKE_BUILD_TYPE=Debug \
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
-DCMAKE_C_FLAGS="-fPIE -fPIC" \
-DCMAKE_CXX_FLAGS="-fPIE -fPIC" \
-DCMAKE_EXE_LINKER_FLAGS="-pie -Wl,--no-undefined" \
-DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-undefined" \
${HERE}/../

cmake --build . --config Debug --target install -- -j12