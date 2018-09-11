source $stdenv/setup
tar xvf $src
cd ubertooth*
cd host
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX:PATH=$out
make
make install
