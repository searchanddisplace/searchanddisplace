{pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem}:
import ./sandd-main.nix {
  inherit (pkgs) stdenv  fetchGit  sbcl  unzip  curl  git  openssl  php phpPackages nodejs;
}