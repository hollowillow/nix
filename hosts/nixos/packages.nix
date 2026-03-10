{ pkgs, ... }:

{
  # https://search.nixos.org
  environment.systemPackages = with pkgs; [
    neovim
    iproute2
    firefox
    git
    stow
    kitty
    unixtools.ping
    keepassxc
  ];

  # programs.firefox.enable = true;
}
