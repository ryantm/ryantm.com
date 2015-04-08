{ stdenv, lib, bundlerEnv, ruby, pkgconfig, which }:

  bundlerEnv {
    name = "ryantm.com";

    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;

  }
