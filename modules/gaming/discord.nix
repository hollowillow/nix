{ pkgs, lib, config, ... }: {

        options.modules.gaming.discord.enable = lib.mkEnableOption "Enables Discord";

        config = lib.mkIf config.modules.gaming.discord.enable {
                environment.systemPackages = with pkgs; [
                        discord-canary
                        grim
                        slurp
                ];
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
