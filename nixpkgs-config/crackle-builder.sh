source $stdenv/setup
tar xvf $src
cd crackle*
make
echo $out
mkdir -p $out/bin
cp crackle $out/bin/crackle
