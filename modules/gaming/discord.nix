{ pkgs, lib, config, ... }: {

        options.modules.gaming.discord.enable = lib.mkEnableOption "Enables Discord";

        config = lib.mkIf config.modules.gaming.discord.enable {
                environment.systemPackages = with pkgs; [
                        discord-canary
                        xdg-desktop-portal-hyprland
                        grim
                        slurp
                ];
        };

}
