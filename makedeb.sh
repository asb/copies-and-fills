#!/bin/sh

set -ex

rm -rf dist
make
mkdir -p dist/usr/lib/arm-linux-gnueabihf
cp -r DEBIAN dist
cp libcofi_rpi.so dist/usr/lib/arm-linux-gnueabihf
dpkg -b dist raspi-copies-and-fills_0.1-armhf.deb
