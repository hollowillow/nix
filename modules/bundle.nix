{ pkgs, lib, ... }: {

	imports = [
		./wm/hyprland.nix
		./network/eno.nix
	];

	# modules.fonts.enable = lib.mkDefault true;
}
