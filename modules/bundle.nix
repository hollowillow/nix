{ pkgs, lib, ... }: {

	imports = [
		./wm/hyprland.nix
		./network/eno.nix
		./system/user.nix
	];

	# modules.fonts.enable = lib.mkDefault true;
	modules.system.user.enable = lib.mkDefault true;
}
