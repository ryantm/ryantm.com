{stdenv,
self,
mmdoc,
} :

stdenv.mkDerivation rec {
  name = "ryantm.com";
  src = self;
  buildInputs = [ mmdoc ];
  installPhase = "mmdoc ryantm.com $src/src $out";
}
