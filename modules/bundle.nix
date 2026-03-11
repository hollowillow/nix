{ pkgs, lib, ... }: {

	imports = [
		./wm/hyprland.nix
		./network/eno.nix
		./network/bluetooth.nix
		./system/user.nix
		./system/pipewire.nix
		./system/fonts.nix
		./shell/fish.nix
		./shell/aliases.nix
	];

	# modules.fonts.enable = lib.mkDefault true;
	modules.system.user.enable = lib.mkDefault true;
	modules.system.pipewire.enable = lib.mkDefault true;
	modules.system.fonts.enable = lib.mkDefault true;
	modules.network.bluetooth.enable = lib.mkDefault true;
	modules.shell.fish.enable = lib.mkDefault true;
	modules.shell.aliases.enable = lib.mkDefault true;
}
