{ stdenv, fetchurl, pkgs, libbtbb }:

stdenv.mkDerivation rec {
  name = "ubertooth-RC2";

  builder = ./ubertooth-builder.sh;

  src = fetchurl {
    url = "https://github.com/greatscottgadgets/ubertooth/releases/download/2017-03-R2/ubertooth-2017-03-R2.tar.xz";
    sha256 = "fbf83fc0129cb9a4e2df614b19fce8ea73419d1a01831142987d25148a9bcd00";
  };
  buildInputs = [ pkgs.cmake libbtbb pkgs.libusb1 pkgs.libpcap pkgs.bluez pkgs.pkgconfig ];
}
