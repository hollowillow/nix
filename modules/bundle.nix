{ pkgs, lib, ... }: {

	imports = [
		./wm/hyprland.nix
		./network/eno.nix
		./network/bluetooth.nix
		./system/user.nix
		./system/pipewire.nix
		./system/fonts.nix
	];

	# modules.fonts.enable = lib.mkDefault true;
	modules.system.user.enable = lib.mkDefault true;
	modules.system.pipewire.enable = lib.mkDefault true;
	modules.system.fonts.enable = lib.mkDefault true;
	modules.network.bluetooth.enable = lib.mkDefault true;
}
