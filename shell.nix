with (import <nixpkgs> {}).pkgs;
let
  pkg = callPackage (import ./default.nix) { };
in
  pkg
