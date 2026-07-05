{
  pkgs,
  lib,
  config,
  ...
}: let
  cursorName = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
  cursorSize = 24;
  gtkName = "adw-gtk3";
  gtkPackage = pkgs.adw-gtk3;
  qtPlatform = "gtk3";
  qtName = "adwaita-dark";
  iconName = "Papirus-Dark"; # Papirus, Papirus-Dark, Papirus-Light
  iconPackage = pkgs.papirus-icon-theme;
in {
  options = {
    modules.other.theme.enable = lib.mkEnableOption "Enable gtk and qt theming";
  };

  config = lib.mkIf config.modules.other.theme.enable {
    # gtk
    home.pointerCursor = {
      gtk.enable = true;
      package = cursorPackage;
      name = cursorName;
      size = cursorSize;
    };

    gtk = {
      enable = true;
      gtk4.theme = null;
      gtk3.extraConfig.gtk-application-prefer-dark-theme = true;

      theme = {
        package = gtkPackage;
        name = gtkName;
      };
      iconTheme = {
        package = iconPackage;
        name = iconName;
      };
    };

    dconf = {
      enable = true;
      settings = {
        "org/gtk/settings/file-chooser" = {
          sort-directories-first = true;
        };
      };
    };

    home.sessionVariables = {
      GTK_THEME = gtkName;
    };

    # qt
    # QT_STYLE_OVERRIDE = "adwaita-dark";
    # needs to be set as an environment variable for theme to apply
    qt = {
      enable = true;
      platformTheme.name = qtPlatform;
      style = {
        name = qtName;
      };
    };
  };
}
