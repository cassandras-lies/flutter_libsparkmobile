#!/usr/bin/env bash

set -e

cd ..
git submodule update --init --recursive
git submodule foreach "git clean -fxd"
git submodule foreach "git reset --hard"

cp src/deps/CMakeLists/sparkmobile/CMakeLists.txt     src/deps/sparkmobile/
cp src/deps/CMakeLists/secp256k1/CMakeLists.txt       src/deps/sparkmobile/secp256k1/


pushd src/deps/boost-cmake
  git apply ../patches/boost-patch.patch
popd

pushd src/deps/openssl-cmake
  git apply ../patches/openssl-cmake-patch.patch
popd
