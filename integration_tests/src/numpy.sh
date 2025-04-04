#!/bin/bash

set -e

VERSION="2.2.4"
URL="https://files.pythonhosted.org/packages/source/n/numpy/numpy-${VERSION}.tar.gz"

wget $URL
tar -xf numpy-${VERSION}.tar.gz
cd numpy-${VERSION}

MESON_CROSS_FILE=$(pyodide config get meson_cross_file)
${UV_RUN_PREFIX} pyodide build -Csetup-args=-Dallow-noblas=true -Csetup-args=--cross-file="${MESON_CROSS_FILE}"
