{ config, pkgs, ... }:

{
    home = {
        pointerCursor = {
            gtk.enable = true;
            x11.enable = true;
            name = "Bibata-Modern-Classic";
            package = pkgs.bibata-cursors;
            size = 24;
        };
        sessionVariables = {
            GTK_THEME = "adw-gtk3";
            XCURSOR_THEME = "Bibata-Modern-Classic";
            XCURSOR_SIZE = "24";
        };
    };
    gtk = {
        enable = true;
        theme = {
            package = pkgs.adw-gtk3;
            name = "adw-gtk3";
        };
        iconTheme = {
            package = pkgs.gruvbox-plus-icons;
            name = "GruvboxPlus";
        };
        cursorTheme = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Classic";
        };
        gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
        gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
        gtk4.theme = config.gtk.theme;
    };
    dconf.settings = {
        "org/gtk/settings/file-chooser" = {
            sort-directories-first = true;
        };
        "org/gnome/desktop/interface" = {
            gtk-theme = "adw-gtk3";
            color-scheme = "prefer-dark";
        };
    };
    qt = {
        enable = true;
        platformTheme = "gtk3";
        style.name = "adwaita-dark";
        style.package = pkgs.adwaita-qt;
    };
}
