#!/bin/bash

# root cmake configure script
# Xia Chen <xiachen1996@foxmail.com>

# ThinkCentre Fedora 30
#INSTALL_PATH="$HOME/software/root"
#SOURCE_PATH="$HOME/src/root"
#BUILD_DIR="$HOME/build/rootbuild"

# Thinkpad P51 Ubuntu 18.04
INSTALL_PATH="/software/root/root-v6-16-00"
SOURCE_PATH="$HOME/src/root"
BUILD_DIR="$HOME/build/root/root-v6-16-00"

#PATH=$(echo $PATH | sed -e 's;:\?$/home/chen/software/anaconda3/bin;;' -e 's;/home/chen/software/anaconda3/bin:\?;;')

if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
    echo "remove $BUILD_DIR"
fi

mkdir -p $BUILD_DIR

cd $BUILD_DIR

if [ $? -eq 0 ]; then
    cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH \
        -Dfail-on-missing=ON \
        -Dcxx11=ON -Dcxx14=ON -Dcxx17=ON \
        -Dminuit2=ON -Droofit=ON \
        -Dtbb=ON -Dsoversion=ON \
        -Dbuiltin_tbb=ON \
        -Dbuiltin_vdt=ON \
        -Dbuiltin_xrootd=ON \
        -Dpythia8=ON \
        -Droot7=ON \
        -Doracle=OFF -Dpgsql=OFF \
        -Dpythia6=OFF \
        $SOURCE_PATH
fi

# cmake --build . --target install -- -j6
