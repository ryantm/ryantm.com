{stdenv,
self,
mmdoc,
strace
} :

stdenv.mkDerivation rec {
  name = "ryantm.com";
  src = self;
  phases = [ "mmdocPhase" ];
  mmdocPhase = "${mmdoc}/bin/mmdoc ryantm.com $src/src $out";
}
