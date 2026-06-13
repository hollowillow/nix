{
  lib,
  config,
  ...
}: {
  options = {
    modules.cli.git.enable = lib.mkEnableOption "Enable git";
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
  };
}
