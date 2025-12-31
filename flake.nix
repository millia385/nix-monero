{
  inputs = {
    nixpkg.url = "github:NixOS/nixpkgs/nixos-25.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    disko,
    ...
  }:
  let
    ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPq/H5Mm/1dTAdH99RwnxtOwv6hHLeokQZJZZvysJfDf";
  in
    {
      nixosConfigurations.monero-server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit ssh_public_key;
        };
        modules = [
          disko.nixosModules.disko
          ./disk-config.nix
          ./nixos/configuration.nix
          ./hardware-configuration.nix
        ];
      };
      };
}