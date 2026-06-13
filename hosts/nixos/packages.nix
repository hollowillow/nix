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
    git # version control
    jujutsu # version control but better
    firefox
    stow
    keepassxc
    yq
    jq
    tmux
    bat
    (btop.override { rocmSupport = true; })
    rocmPackages.rocm-smi
    ncdu
    viu
    ani-cli
    ani-skip
    newsraft
    qbittorrent
    mkvtoolnix
    fd
    ripgrep
    awww
  ];
}
