#!/bin/bash

set -e

# Assuming current directory it's MeTA's root, and we are running
# Ubuntu 14.04 setup as per https://meta-toolkit.org/setup-guide.html#ubuntu-1404-lts-build-guide

rm -rf meta
git clone https://github.com/meta-toolkit/meta.git
pushd meta

# We'll be using this version in the course
echo "Using MeTA 2.2.0"
git reset --hard v2.2.0
git submodule update --init --recursive

echo "Patching ICU URL"
git apply $HOME/find_icu.patch

echo "Building  MeTA"
rm -rf deps/icu
rm -rf build 
mkdir build && cd build && cp ../config.toml .
cmake ../ -DCMAKE_BUILD_TYPE=Release
make

echo "Running unit tests"
./unit-test --reporter=spec
