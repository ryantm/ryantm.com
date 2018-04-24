with (import <nixpkgs> {});
let
  gems = bundlerEnv {
    name = "ryantm.com";
    inherit ruby;
    gemdir = ./.;
  };
in stdenv.mkDerivation {
  name = "ryantm.com";
  buildInputs = [gems ruby];
}
