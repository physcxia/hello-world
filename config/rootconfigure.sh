#!/usr/bin/bash

# root cmake configure script
# Xia Chen <xiachen1996@foxmail.com>

INSTALL_PATH="$HOME/software/root"
SOURCE_PATH="$HOME/src/root"
BUILD_DIR="$HOME/build/rootbuild"
#PATH=$(echo $PATH | sed -e 's;:\?$/home/chen/software/anaconda3/bin;;' -e 's;/home/chen/software/anaconda3/bin:\?;;')

if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
fi

mkdir -p $BUILD_DIR

cd $BUILD_DIR

if [ $? = 0 ]; then
    cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH \
        -Dfail-on-missing=ON \
        -Dcxx11=ON -Dcxx14=ON -Dcxx17=ON \
        -Dminuit2=ON -Droofit=ON \
        -Dtbb=ON -Dsoversion=ON \
        -Dbuiltin_vdt=ON \
        -Dxrootd=OFF \
        -Doracle=OFF -Dpgsql=OFF \
        -Dpythia6=OFF \
        -Dgfal=OFF \
        $SOURCE_PATH
fi

# cmake --build . --target install -- -j6
