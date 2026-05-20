{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        prismlauncher = {
            url = "github:diegiwg/prismlauncher-cracked";
            # inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... } @ inputs:
    let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
                ./hosts/nixos/configuration.nix
                ./modules/bundle.nix
                home-manager.nixosModules.default
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.hollowillow = ./home/hollowillow/home.nix;
                    };
                }
            ];
        };
    };
}
