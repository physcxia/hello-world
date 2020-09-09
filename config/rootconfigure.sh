#!/bin/bash

# root cmake configure script
# Xia Chen <xiachen1996@foxmail.com>

# ThinkCentre Fedora 30
#INSTALL_PATH="$HOME/software/root"
#SOURCE_PATH="$HOME/src/root"
#BUILD_DIR="$HOME/build/rootbuild"

# Thinkpad P51 Ubuntu 18.04
INSTALL_PATH="/software/root/root-v6-22-00-patches"
SOURCE_PATH="$HOME/src/root"
BUILD_DIR="$HOME/build/root/root-v6-22-00-patches"

PYTHON="/usr/bin/python3"
#PATH=$(echo $PATH | sed -e 's;:\?$/home/chen/software/anaconda3/bin;;' -e 's;/home/chen/software/anaconda3/bin:\?;;')

if [ -d $BUILD_DIR ]; then
    rm -rf $BUILD_DIR
    echo "remove $BUILD_DIR"
fi

mkdir -p $BUILD_DIR

cd $BUILD_DIR


if [ $? -eq 0 ]; then
    cmake -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH \
        -DPYTHON_EXECUTABLE=$PYTHON \
        -Dfail-on-missing=ON \
        -Dcxx11=ON -Dcxx14=ON -Dcxx17=ON \
        -Dccache=ON \
        -Dpyroot=ON \
        -Dminuit2=ON \
        -Droofit=ON \
        -Dtbb=ON \
        -Dsoversion=ON \
        -Dpythia8=ON \
        -Droot7=ON \
        -Doracle=OFF \
        -Dpgsql=OFF \
        -Dpythia6=OFF \
        -Dbuiltin_xrootd=ON \
        -Dbuiltin_tbb=ON \
        -Dbuiltin_vdt=ON \
        -Dbuiltin_lzma=ON \
        -Dbuiltin_zstd=ON \
        -Dbuiltin_xxhash=ON \
        -Dbuiltin_lz4=ON \
        -Dbuiltin_afterimage=ON \
        -Dbuiltin_gl2ps=ON \
        $SOURCE_PATH
fi

# cmake --build . --target install -- -j6
