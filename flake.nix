{
  description = "A very basic flake";

  inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        prismlauncher = {
                url = "github:diegiwg/prismlauncher-cracked";
                inputs.nixpkgs.follows = "nixpkgs";
        };
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                ./hosts/nixos/configuration.nix
                ./modules/bundle.nix
                ];
        };
  };
}
