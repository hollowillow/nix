{ pkgs, lib, config, ... }: {

	options.modules.wm.hyprland.enable = lib.mkEnableOption "Enables hyprland";

	config = lib.mkIf config.modules.wm.hyprland.enable {
  		programs.hyprland = {
			enable = true;
			xwayland.enable = true;
		};
  		programs.waybar.enable = true;
		services.getty = {
			autologinUser = "hollowillow";
			autologinOnce = true;
		};
		environment.loginShellInit = ''
			[[ "$(tty)" == /dev/tty1 ]] && start-hyprland
		'';
  		environment.systemPackages = with pkgs; [
			alacritty
			waybar-mpris
			swaybg
			wl-clipboard
			dunst # or snc or mako?
			# ydotool
			# wev
  		];
	};

}
