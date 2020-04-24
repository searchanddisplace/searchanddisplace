{ pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem
}:
let
  name = "search-and-diplace";
  inherit (pkgs) stdenv;
  composerEnv = import ./composer-env.nix {
    inherit (pkgs) stdenv writeTextFile fetchurl php unzip phpPackages;
  };
  phpPackage = import ./sandd-php-packages.nix {
      inherit composerEnv;
      inherit (pkgs) fetchurl fetchgit fetchhg fetchsvn;
      noDev = true; # Disable development dependencies
      inherit name;
    };
in
with import (builtins.fetchurl https://github.com/searchanddisplace/searchanddisplace/raw/master/composer.json) {};
phpPackage.override {
  #buildCommand = ''
  #    curl -o composer.json https://github.com/searchanddisplace/searchanddisplace/raw/master/composer.json
  #'';
  removeComposerArtifacts = true; # Remove composer configuration files
  buildInputs = [ pkgs.git ]; # Add here any environment dependency
  # Add below all lines of post installation instructions e.g ''npm install'' ?
  postInstall = ''

  '';
}