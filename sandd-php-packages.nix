{composerEnv, fetchurl, fetchgit ? null, fetchhg ? null, fetchsvn ? null, noDev ? false, name ? "default"}:

let
  packages = {
   # Add here any composer loaded dependency or use composer2nix to generate the list

  };
  devPackages = {};
in
composerEnv.buildPackage {
  inherit packages devPackages noDev;
  inherit name;
  src = ./.;
  executable = false;
  symlinkDependencies = false;
  meta = {};
}
