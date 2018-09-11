{ stdenv, fetchurl, pkgs }:

stdenv.mkDerivation rec {
  name = "libbtbb-RC2";

  src = fetchurl {
    url = "https://github.com/greatscottgadgets/libbtbb/archive/2017-03-R2.tar.gz";
    sha256 = "2b3ea5f07b7022e862f367e8a9a217e1d10920aecdc4eba7b7309724fb229cfd";
  };
  buildInputs = [ pkgs.cmake ];
}
