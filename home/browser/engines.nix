{ pkgs, lib, config, ... }:
{
  options = {
    modules.browser.engines.enable = 
      lib.mkEnableOption "Enable engines for librewolf";
  };

  config = lib.mkIf config.modules.browser.engines.enable {
    programs.librewolf.profiles.default.search = {
      force = true;
      default = "ddg";

      # broken, currently only works with the name, not id
      order = [
        "DuckDuckGo"
        "Nix Packages"
        "Nix Options"
        "MyNixOS"
        "NixOS Wiki"
        "Github"
      ];

      engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
        "Nix Options" = {
          urls = [
            {
              template = "https://search.nixos.org/options";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@no" ];
        };
        "MyNixOS" = {
          urls = [
            {
              template = "https://mynixos.com/search";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@ns" ];
        };
        "NixOS Wiki" = {
          urls = [
            {
              template = "https://wiki.nixos.org/w/index.php";
              params = [
                {
                  name = "search";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@nw" ];
        };
        "Github" = {
          urls = [
            {
              template = "https://github.com/search?q=test&type=repositories";
              params = [
                {
                  name = "type";
                  value = "repositories";
                }
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          definedAliases = [ "@gh" ];
        };
      };
    };
  };
}
