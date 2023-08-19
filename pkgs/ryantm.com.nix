{
  stdenvNoCC,
  mmdoc,
}:
stdenvNoCC.mkDerivation rec {
  name = "ryantm.com";
  src = ../src;
  phases = ["mmdocPhase"];
  mmdocPhase = "${mmdoc}/bin/mmdoc ryantm.com $src $out";
}
