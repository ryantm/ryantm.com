{
  inputs.nixpkgs.url = "nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.mmdoc.url = "/home/ryantm/p/mmdoc";
  inputs.mmdoc.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, flake-utils, mmdoc } :
    flake-utils.lib.eachDefaultSystem (system: {
      packages."ryantm.com" = nixpkgs.legacyPackages.${system}.callPackage ./pkgs/ryantm.com.nix {
        inherit self;
        inherit (mmdoc.packages.${system}) mmdoc;
      };
      defaultPackage = self.packages.${system}."ryantm.com";
    });
}
