{ pkgs, lib, ... }: {

	imports = [
		./wm/hyprland.nix
		./network/eno.nix
		./system/user.nix
		./system/pipewire.nix
	];

	# modules.fonts.enable = lib.mkDefault true;
	modules.system.user.enable = lib.mkDefault true;
	modules.system.pipewire.enable = lib.mkDefault true;
}
