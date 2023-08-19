{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.site = pkgs.callPackage ./pkgs/ryantm.com.nix {};
    packages.x86_64-linux.default = self.packages.x86_64-linux.site;
  };
}
