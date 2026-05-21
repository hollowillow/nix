{ pkgs, lib, ... }:
{
  imports = [
    ./browser/librewolf.nix
    ./browser/engines.nix
    ./browser/bookmarks.nix
  ];

  modules.browser.librewolf.enable = lib.mkDefault true;
  modules.browser.engines.enable = lib.mkDefault true;
  modules.browser.bookmarks.enable = lib.mkDefault true;
}
