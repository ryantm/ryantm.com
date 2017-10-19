with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "rtm-bundler-env";
    inherit ruby;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "rtm";
  buildInputs = [ env ];
}
