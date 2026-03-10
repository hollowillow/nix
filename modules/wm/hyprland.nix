{ pkgs, lib, config, ... }: {

	options.modules.wm.hyprland.enable = lib.mkEnableOption "Enables hyprland";

	config = lib.mkIf config.modules.wm.hyprland.enable {
  		programs.hyprland.enable = true;
  		programs.waybar.enable = true;
  		environment.systemPackages = with pkgs; [
			alacritty
  		];
	};

}
