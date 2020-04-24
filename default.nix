{ system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
  #self = in self
in rec {
    search-and-displace = pkgs.callPackage ./pkgs/sandd.nix {
      inherit pkgs;
    };
}
