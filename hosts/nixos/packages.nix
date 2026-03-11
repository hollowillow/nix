{ pkgs, ... }:

{
  # https://search.nixos.org
  environment.systemPackages = with pkgs; [
    neovim # text editor
    eza # pretty ls
    atuin # smart shell history
    fzf # fuzzy picker, alternative is skim
    iproute2 # ip command
    unixtools.ping # ping command
    firefox
    git
    stow
    keepassxc
    yq
    jq
    tmux
    ranger
    btop
    ncdu
  ];
}
