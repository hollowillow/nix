{
  lib,
  config,
  ...
}: {
  options = {
    modules.browser.bookmarks.enable = lib.mkEnableOption "Enable bookmarks for librewolf";
  };

  config = lib.mkIf config.modules.browser.bookmarks.enable {
    programs.librewolf.profiles.default.bookmarks = {
      force = true;
      settings = [
        {
          name = "toolbar";
          toolbar = true;
          bookmarks = [
            {
              name = "Hyprland";
              url = "https://wiki.hypr.land/";
            }
            {
              name = "Neovim";
              url = "https://neovim.io/doc/";
            }
            "separator"
            {
              name = "Proton";
              url = "https://account.proton.me/mail";
            }
            "separator"
            {
              name = "Github";
              url = "https://github.com/hollowillow/";
            }
          ];
        }
      ];
    };
  };
}
