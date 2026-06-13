{
  pkgs,
  lib,
  config,
  ...
}:
let
  cursorName = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
  cursorSize = 24;
  gtkName = "adw-gtk3";
  gtkPackage = pkgs.adw-gtk3;
  qtPlatform = "gtk3";
  qtName = "adwaita-dark";
  iconName = "GruvboxPlus";
  iconPackage = pkgs.gruvbox-plus-icons;
in
{
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

      theme = {
        package = gtkPackage;
        name = gtkName;
      };
      iconTheme = {
        package = iconPackage;
        name = iconName;
      };
    };

    dconf.settings = {
      "org/gtk/settings/file-chooser" = {
        sort-directories-first = true;
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
      platformTheme.name = "gtk3";
      style = {
        name = qtName;
      };
    };
  };
}
