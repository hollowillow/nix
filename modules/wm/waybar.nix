{ pkgs, lib, config, ... }: {

        options.modules.wm.waybar.enable = lib.mkEnableOption "Enables waybar";

        config = lib.mkIf config.modules.wm.waybar.enable {
                programs.waybar.enable = true;
                environment.systemPackages = [ pkgs.waybar-mpris ];
        };

}
