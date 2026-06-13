{
  pkgs,
  inputs,
  ...
}: {
  # https://search.nixos.org
  environment.systemPackages = with pkgs; [
    # DEV TOOLS
    neovim # text editor
    eza # pretty ls
    atuin # smart shell history
    fzf # fuzzy picker, alternative is skim
    git # version control
    jujutsu # version control but better
    fd # better find
    ripgrep # better grep
    alejandra # nix formatting
    nixd # nix language server

    iproute2 # ip command
    unixtools.ping # ping command
    firefox
    stow
    keepassxc
    yq
    jq
    tmux
    bat
    (btop.override {rocmSupport = true;})
    rocmPackages.rocm-smi
    ncdu
    viu
    ani-cli
    ani-skip
    newsraft
    qbittorrent
    mkvtoolnix
    awww
  ];
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
