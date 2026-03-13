{ pkgs, lib, config, ... }: {

	options.modules.shell.variables.enable = lib.mkEnableOption "Enables shell aliases";

	config = lib.mkIf config.modules.shell.variables.enable {
		environment.variables = {
			# ADD TO PATH
			PATH = "$PATH:$HOME/.local/scripts";

			# XDG VARIABLES
			XDG_CONFIG_HOME = "$HOME/.config";
			XDG_DATA_HOME = "$HOME/.local/share";
			XDG_STATE_HOME = "$HOME/.local/state";
			XDG_CACHE_HOME = "$HOME/.cache";

			XDG_DESKTOP_DIR = "$HOME";
			XDG_DOCUMENTS_DIR = "$HOME/media/documents";
			XDG_DOWNLOAD_DIR = "$HOME/inbox";
			XDG_MUSIC_DIR = "$HOME/media/music";
			XDG_PICTURES_DIR = "$HOME/media/pictures";
			XDG_PUBLICSHARE_DIR = "$HOME/inbox/public";
			XDG_TEMPLATES_DIR = "$HOME/inbox/templates";
			XDG_VIDEOS_DIR = "$HOME/media/videos";

			GRIM_DEFAULT_DIR = "$HOME/media/pictures/screenshots";

			# ENV VARIABLES
			TERMINAL = "ghostty";
			EDITOR = "nvim";
			BROWSER= "firefox";
			MENU = "fzf";
			MANPAGER="nvim +Man! +'set relativenumber'";

			# SCRIPT VARIABLES
			WALLPAPERS_DIR = "$HOME/.local/share/wallpapers/hd";
			NOTES_DIR = "$HOME/notes/zettelkasten";
			BOOKMARK_FILE = "$HOME/notes/bookmarks.json";
			SEARCH_HIST_FILE = "$HOME/.local/state/search_history";
			AUTOSTART_DIR = "$HOME/.local/share/autostart_profiles";
			RSS_FILE = "notes/rss_file";
			FZF_DEFAULT_HEADER = "btab:toggle-all  ctrl-a:select-all  ctrl-d:deselect-all  ctrl-t:toggle-preview";
			FZF_DEFAULT_OPTS_FILE = "$HOME/.config/fzfrc";
			RIPGREP_CONFIG_PATH = "$HOME/.config/ripgreprc";
		};
	};

}
