#!/bin/bash -
install_path="$HOME/software/geant4"
source_path="$HOME/src/geant4.10.05"
#PATH=$(echo $PATH | sed -e 's;:\?$/home/chen/software/anaconda3/bin;;' -e 's;/home/chen/software/anaconda3/bin:\?;;')

#sudo dnf install xerces-c-devel libXmu-devel

cd $source_path
if [ -d ./build ]; then
    rm -rf ./build
fi

mkdir ./build
cd ./build

cmake -DCMAKE_INSTALL_PREFIX=$install_path \
    -DGEANT4_INSTALL_DATA=ON \
    -DGEANT4_BUILD_MULTITHREADED=ON \
    -DGEANT4_USE_GDML=ON \
    -DGEANT4_USE_QT=ON \
    -DGEANT4_USE_OPENGL_X11=ON \
    -DGEANT4_USE_RAYTRACER_X11=ON \
    -DGEANT4_USE_SYSTEM_ZLIB=ON \
    -DGEANT4_USE_FREETYPE=ON \
    -DBUILD_STATIC_LIBS=ON \
    $source_path

# cd ./build
# cmake --build . --config Release --target install -- -j6

