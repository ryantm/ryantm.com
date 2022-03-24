{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    packages."x86_64-linux"."ryantm.com" = pkgs.callPackage ./pkgs/ryantm.com.nix {inherit self;};
    defaultPackage."x86_64-linux" = self.packages."x86_64-linux"."ryantm.com";
  };
}
