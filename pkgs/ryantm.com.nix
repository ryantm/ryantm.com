{
  stdenvNoCC,
  self,
  mmdoc,
  strace,
}:
stdenvNoCC.mkDerivation rec {
  name = "ryantm.com";
  src = self;
  phases = ["mmdocPhase"];
  mmdocPhase = "${mmdoc}/bin/mmdoc ryantm.com $src/src $out";
}
