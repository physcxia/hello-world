
install_path="$HOME/software/root"
source_path="$HOME/src/root-6.14.06"
#PATH=$(echo $PATH | sed -e 's;:\?$/home/chen/software/anaconda3/bin;;' -e 's;/home/chen/software/anaconda3/bin:\?;;')

cd $source_path
if [ -d builddir ]; then
    rm -rf builddir
fi

mkdir builddir
cd builddir

cmake -DCMAKE_INSTALL_PREFIX=$install_path \
    -Dcxx14=ON \
    -Dcxx17=ON \
    -Dbuiltin_zlib=ON \
    ..

#    -DPYTHIA8_DIR=/home/chen/software/pythia \
#    -DPYTHIA8_INCLUDE_DIR=/home/chen/software/pythia/include \
#    -DPYTHIA8_LIBRARY=/home/chen/software/pythia/lib \
# cd $source_path/builddir
# cmake --build . --target install -- -j6
