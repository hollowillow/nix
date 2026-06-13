{
  lib,
  config,
  ...
}: let
  home = config.home.homeDirectory;
in {
  options = {
    modules.other.xdgDirs.enable = lib.mkEnableOption "Enables XDG dir specification";
  };

  config = lib.mkIf config.modules.other.xdgDirs.enable {
    xdg = {
      enable = true;
      localBinInPath = true;

      dataHome = "${home}/.local/share";
      stateHome = "${home}/.local/state";
      cacheHome = "${home}/.cache";
      configHome = "${home}/.config";
      binHome = "${home}/.local/bin";

      userDirs = {
        enable = true;
        createDirectories = true;
        setSessionVariables = true;

        desktop = "${home}/";
        documents = "${home}/media/documents";
        download = "${home}/inbox";
        music = "${home}/media/music";
        pictures = "${home}/media/pictures";
        projects = "${home}/projects";
        publicShare = "${home}/inbox/public";
        templates = "${home}/inbox/templates";
        videos = "${home}/media/videos";
      };
    };
  };
}
