{ config, pkgs, ... }:

{
    imports = [
        ./modules/theme.nix
        ./modules/librewolf.nix
    ];

    home = {
        username = "hollowillow";
        homeDirectory = "/home/hollowillow";
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "25.11";

    # let home-manager manage itself
    programs.home-manager.enable = true;
}
