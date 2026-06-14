{
  lib,
  config,
  ...
}: {
  options = {
    modules.cli.git.enable = lib.mkEnableOption "Enable git and jujutsu";
  };

  config = lib.mkIf config.modules.cli.git.enable {
    programs.git = {
      enable = true;
      signing = {
        signByDefault = true;
        key = "/home/hollowillow/.ssh/id_ed25519.pub";
      };
      settings = {
        user = {
          name = "hollowillow";
          email = "188023203+hollowillow@users.noreply.github.com";
        };
        init.defaultBranch = "main";
        gpg.format = "ssh";
        safe.directory = "/etc/nixos";
      };
    };
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "hollowillow";
          email = "188023203+hollowillow@users.noreply.github.com";
        };
        ui = {
          default-command = "log";
        };
        signing = {
          behaviour = "own";
          backend = "ssh";
          key = "/home/hollowillow/.ssh/id_ed25519.pub";
        };
      };
    };
  };
}
