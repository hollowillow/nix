{
  config,
  pkgs,
  ...
}:
{
  home = {
    username = "hollowillow";
    homeDirectory = "/home/hollowillow";
  };

  # home manager release, don't change
  home.stateVersion = "25.11";

  # let home-manager manage itself
  programs.home-manager.enable = true;
}
