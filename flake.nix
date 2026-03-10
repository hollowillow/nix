{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
	pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
  	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    		modules = [
		./hosts/nixos/configuration.nix
		./modules/bundle.nix
		];
    	};
  };
}
