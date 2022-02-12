{
  inputs.nixpkgs.url = "nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  #inputs.mmdoc.url = "/home/ryantm/p/mmdoc";
  inputs.mmdoc.url = "github:ryantm/mmdoc";

  outputs = { self, nixpkgs, flake-utils, mmdoc } :
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages."ryantm.com" = pkgs.callPackage ./pkgs/ryantm.com.nix {
          inherit self;
          inherit (mmdoc.packages.${system}) mmdoc;
        };
        defaultPackage = self.packages.${system}."ryantm.com";
      });
}
