{ stdenv, lib, bundlerEnv, ruby, pkgconfig, which }:

bundlerEnv {
  name = "ryantm.com";

  inherit ruby;
  gemfile = ./Gemfile;
  lockfile = ./Gemfile.lock;
  gemset = ./gemset.nix;


  buildInputs = [ which ];

  meta = with lib; {
    description = "Ryan Mulligan's personal website";
    homepage = "http://www.ryantm.com";
    license = stdenv.lib.licenses.publicDomain;
    maintainers = with maintainers; [ ryantm ];
    platforms   = platforms.unix;
  };
}
