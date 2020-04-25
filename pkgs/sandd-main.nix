{ stdenv, fetchGit, sbcl, unzip, curl, git, openssl, php, phpPackages, nodejs}:
let
  name = "search-and-displace";
  gitStore = builtins.fetchGit {
      url = "https://github.com/searchanddisplace/searchanddisplace.git";
      #url = "https://github.com/newroco/rocket_integration.git";
      ref = "master";
  };
  inherit (phpPackages) composer;
  buildPackage = { name, src }:
      stdenv.mkDerivation {
        inherit name src;
        buildInputs = [ curl git openssl php composer nodejs ];
        buildCommand = ''
           #cd $src
           #composer update
           #composer install
           #npm install
           # cp .env.example .env
           mkdir -p $out
           cp -R $src/* $out
           mv * $out
           # Remove unwanted files - that is impossible with, nix, give up...
           #rm -f $out/*.nix
           #rm -R $out/pkgs
           # Remove stuff not needed on production - composer.lock, composer.json, etc, etc  - that is impossible with, nix, give up...
         '';
      };
in
buildPackage {
    inherit name;
    #src = ./.;
    src = gitStore;
}
