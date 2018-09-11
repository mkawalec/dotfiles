{ pkgs }:

let nixpkgs = import <nixpkgs> {};
    hp = (import <nixpkgs> {}).haskell.packages.ghc7103;
    haskellPackages = hp.override {
      overrides = self: super: {
        #time = hp.callHackage "time" "1.6.0.1" {};
      };
    };
   libbtbb = nixpkgs.callPackage ./libbtbb.nix {};
   ubertooth = nixpkgs.callPackage ./ubertooth.nix { inherit libbtbb; };
   crackle = nixpkgs.callPackage ./crackle.nix { };
in 
{
  allowUnfree = true;

  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true;
    enablePepperPDF = true;
  };

  packageOverrides = super: let self = super.pkgs; in with self; rec {
    bthack = super.buildEnv {
      name = "bthack";
      paths = [
        libbtbb
        ubertooth
        crackle
      ];
    };
  };
}
