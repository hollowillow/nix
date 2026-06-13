{lib, ...}: {
  imports = [
    ./browser/librewolf.nix
    ./browser/engines.nix
    ./browser/bookmarks.nix
    ./cli/git.nix
    ./other/xdgDirs.nix
    ./other/theme.nix
  ];

  modules.browser.librewolf.enable = lib.mkDefault true;
  modules.browser.engines.enable = lib.mkDefault true;
  modules.browser.bookmarks.enable = lib.mkDefault true;
  modules.cli.git.enable = lib.mkDefault true;
  modules.other.xdgDirs.enable = lib.mkDefault true;
  modules.other.theme.enable = lib.mkDefault true;
}
