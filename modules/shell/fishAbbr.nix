{ pkgs, lib, config, ... }: {

    options.modules.shell.fishAbbr.enable = lib.mkEnableOption "Enables fish abbreviations";

    config = lib.mkIf config.modules.shell.fishAbbr.enable {
        programs.fish.interactiveShellInit = "bind \" \" expand-abbr or self-insert";
        programs.fish.shellAbbrs = {
            # NVIM
            vi = "nvim";
            vim = "nvim";

            # GIT
            gs = "git status";
            ga = "git add ";
            gc = "git clone ";
            gcm = "git commit -m \"";
            gca = "git commit --amend";
            gcan = "git commit --amend --no-edit";
            gp = "git push";
            gpf = "git push --force";

            # NIX
            nr = "sudo nixos-rebuild ";
            nrs = "sudo nixos-rebuild switch";
            nrb = "sudo nixos-rebuild boot";
            ns = "nix shell ";
            nsp = "nix shell nixpkgs#";
            nsg = "nix shell github:";
            nd = "nix develop .";
            nf = "nix flake ";
            nfi = "nix flake init";
            nfu = "nix flake update";
        };
    };

}
