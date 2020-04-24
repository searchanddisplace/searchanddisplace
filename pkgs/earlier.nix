{ pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem
}:
let
  name = "search-and-displace";
 # gitStore = builtins.fetchGit {
 #    url = "https://github.com/searchanddisplace/searchanddisplace.git";
 #    ref = "master";
 #   };
 # builtins.filterSource
 #     (path: type: baseNameOf path != "sandd-php-packages.nix" || baseNameOf path != "earlier.nix" || baseNameOf path != "composer-env.nix")
 #     (builtins.fetchGit {
 #           url = "https://github.com/searchanddisplace/searchanddisplace.git";
 #           ref = "master";
 #      });


  inherit (pkgs) stdenv;
  composerEnv = import ./composer-env.nix {
    inherit (pkgs) stdenv writeTextFile fetchurl php unzip phpPackages;
  };
  phpPackage = import ./sandd-php-packages.nix {
      inherit composerEnv;
      inherit (pkgs) fetchurl fetchgit fetchhg fetchsvn;
      #src = gitStore;
      noDev = true; # Disable development dependencies
      inherit name;
    };
in
phpPackage.override {
  removeComposerArtifacts = true; # Remove composer configuration files
  buildInputs = [ pkgs.git ]; # Add here any environment dependency
  # Add below all lines of post installation instructions e.g ''npm install'' ?
  postInstall = ''
    ll ./
  '';
}