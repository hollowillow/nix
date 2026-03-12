{ pkgs, lib, config, ... }: {

        options.modules.wm.portal.enable = lib.mkEnableOption "Enables xdg desktop portal for hyprland";

        config = lib.mkIf config.modules.wm.portal.enable {
                xdg.portal = {
                        enable = true;
                        extraPortals = with pkgs; [
                                xdg-desktop-portal-hyprland
                                xdg-desktop-portal-gtk
                        ];
                        config.common.default = [ "gtk" ];
                        config.hyprland.default = [ "gtk" "hyprland" ];
                };
        };

}
