{ pkgs, lib, config, ... }: {

	options.modules.wm.hyprland.enable = lib.mkEnableOption "Enables hyprland";

	config = lib.mkIf config.modules.wm.hyprland.enable {
  		programs.hyprland = {
			enable = true;
			xwayland.enable = true;
		};
		services.getty = {
			autologinUser = "hollowillow";
			autologinOnce = true;
		};
		environment.loginShellInit = ''
			[[ "$(tty)" == /dev/tty1 ]] && (sleep 0.2; start-hyprland)
		'';
                xdg.portal = {
                        enable = true;
                        extraPortals = with pkgs; [
                                xdg-desktop-portal-hyprland
                                xdg-desktop-portal-gtk
                        ];
                        config.hyprland.default = [ "gtk" "hyprland" ];
                };
  		environment.systemPackages = with pkgs; [
                        grim # xdg dp dependancy
                        slurp # xdg dp dependancy
			# alacritty
                        ghostty
			swaybg
			wl-clipboard
			dunst # or snc or mako?
			libnotify
			# ydotool
			# wev
  		];
	};

}
