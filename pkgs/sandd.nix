{ pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem
}:
let
  name = "search-and-displace";
  inherit (pkgs) stdenv git curl php phpPackages;
  inherit (phpPackages) composer;
  gitStore = builtins.fetchGit {
      url = "https://github.com/searchanddisplace/searchanddisplace.git";
      ref = "master";
  };
  buildPackage = { name, src }:
      stdenv.mkDerivation {
        inherit name src;
        buildInputs = [ ];
        buildCommand = ''
          composer install
          npm install
          cp .env.example .env
          # Remove stuff not needed on production - composer.loc, .json, etc, etc
        '';
      };
in
buildPackage {
    inherit name;
    src = gitStore;
}
