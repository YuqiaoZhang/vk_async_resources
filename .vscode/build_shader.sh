#!/bin/bash

HERE="$(dirname "$(readlink -f "${0}")")"

PATH="/system/bin64${PATH:+:}${PATH}"

glslangValidator -V "${HERE}/../test.vert.glsl" -o "${HERE}/../test.vert.spv"
glslangValidator -V "${HERE}/../test.frag.glsl" -o "${HERE}/../test.frag.spv"
