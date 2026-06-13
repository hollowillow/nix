{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    modules.browser.librewolf.enable = lib.mkEnableOption "Enable librewolf";
  };

  config = lib.mkIf config.modules.browser.librewolf.enable {
    programs.librewolf = {
      enable = true;
      settings = {
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
        "browser.startup.homepage" = "about:blank";
      };
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = {
            "extensions.autoDisableScopes" = false;
          };
          extensions = {
            packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
              keepassxc-browser
              skip-redirect
              vimium
              ublock-origin
              darkreader
              i-dont-care-about-cookies
            ];
          };
        };
        hardened = {
          id = 1;
          name = "hardened";
          settings = {
            "webgl.disabled" = true;
            "javascript.enabled" = false;
          };
        };
      };
    };
  };
}
