#!/bin/sh

set -ex

rm -rf dist
make
fakeroot sh - <<EOF
mkdir -p dist/usr/lib/arm-linux-gnueabihf
cp -r DEBIAN dist
cp libcofi_rpi.so dist/usr/lib/arm-linux-gnueabihf
chown root:root -R dist
dpkg -b dist raspi-copies-and-fills_0.2-armhf.deb
EOF
