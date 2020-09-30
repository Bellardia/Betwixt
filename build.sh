#!/bin/bash

# clean up after last build
rm -rf build/
rm -rf bin/

mkdir build/
mkdir bin/

# move files required by production app to the /build folder
cp -r src/ build/src/
cp -r gfx/ build/gfx/
cp package.json build/

# install all dependencies
cd build/
npm i --production
cd ..

# build packages for all supported OS versions
ELECTRON_MIRROR=https://github.com ELECTRON_CUSTOM_DIR=/Bellardia/Betwixt/raw/master/electron electron-packager ./build/ Betwixt --out ./bin/ --platform=darwin --arch=x64 --icon=./gfx/icon
