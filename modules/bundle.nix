{ pkgs, lib, ... }: {

	imports = [
		./wm/hyprland.nix
		./wm/waybar.nix
		./network/eno.nix
		./network/bluetooth.nix
		./system/user.nix
		./system/pipewire.nix
		./system/fonts.nix
		./shell/fish.nix
		./shell/fishAbbr.nix
		./shell/aliases.nix
		./shell/variables.nix
		./shell/lf.nix
		./gaming/steam.nix
		./gaming/discord.nix
		./gaming/minecraft.nix
		./gaming/retroarch.nix
		./programs/mpv.nix
	];

	# modules.fonts.enable = lib.mkDefault true;
	modules.system.user.enable = lib.mkDefault true;
	modules.system.pipewire.enable = lib.mkDefault true;
	modules.system.fonts.enable = lib.mkDefault true;
	modules.network.bluetooth.enable = lib.mkDefault true;
	modules.shell.fish.enable = lib.mkDefault true;
	modules.shell.fishAbbr.enable = lib.mkDefault true;
	modules.shell.aliases.enable = lib.mkDefault true;
	modules.shell.variables.enable = lib.mkDefault true;
	modules.shell.lf.enable = lib.mkDefault true;
}
