{
  pkgs,
  lib,
  config,
  ...
}: {
  options.modules.shell.direnv.enable = lib.mkEnableOption "Enables direnv";

  config = lib.mkIf config.modules.shell.direnv.enable {
    programs.direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
      settings = {
        global = {
          log_format = "-";
          log_filter = "^loading";
          hide_env_diff = true;
        };
      };
    };
  };
}
