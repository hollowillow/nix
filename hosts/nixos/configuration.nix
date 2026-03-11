{ config, lib, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./packages.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  modules.network.eno.enable = true;
  modules.wm.hyprland.enable = true;
  modules.gaming = {
        steam.enable = true;
        discord.enable = true;
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}
