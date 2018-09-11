{ stdenv, fetchurl, pkgs }:

stdenv.mkDerivation rec {
  name = "crackle-0.1";

  builder = ./crackle-builder.sh;

  src = fetchurl {
    url = "https://github.com/mikeryan/crackle/archive/0.1.tar.gz";
    sha256 = "78d087f0c03ae57538c13ade637c753612f28b51c6c57f855a4572db33081532";
  };
  buildInputs = [ pkgs.libpcap ];
}
