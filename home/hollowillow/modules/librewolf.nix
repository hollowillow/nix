{ config, pkgs, inputs, ... }: 

{
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
                settings = { "extensions.autoDisableScopes" = false; };
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

    # Search engines
    programs.librewolf.profiles.default.search = {
        force = true;
        default = "ddg";

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
                            { name = "channel"; value = "unstable"; }
                            { name = "query";   value = "{searchTerms}"; }
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
                            { name = "channel"; value = "unstable"; }
                            { name = "query";   value = "{searchTerms}"; }
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
                            { name = "q"; value = "{searchTerms}"; }
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
                            { name = "search"; value = "{searchTerms}"; }
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
                            { name = "type"; value = "repositories"; }
                            { name = "q";   value = "{searchTerms}"; }
                        ];
                    }
                ];
                definedAliases = [ "@gh" ];
            };
        };
    };

    # Bookmarks
    programs.librewolf.profiles.default.bookmarks = {
        force = true;
        settings = [
            {
                name = "toolbar";
                toolbar = true;
                bookmarks = [
                    { name = "Hyprland"; url = "https://wiki.hypr.land/"; }
                    { name = "Neovim"; url = "https://neovim.io/doc/"; }
                    "separator"
                    { name = "Proton"; url = "https://account.proton.me/mail"; }
                    "separator"
                    { name = "Github"; url = "https://github.com/hollowillow/"; }
                ];
            }
        ];
    };
}
