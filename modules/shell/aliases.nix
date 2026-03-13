{ pkgs, lib, config, ... }: {

	options.modules.shell.aliases.enable = lib.mkEnableOption "Enables shell aliases";

	config = lib.mkIf config.modules.shell.aliases.enable {
		environment.shellAliases = {
			ls = "eza --color=always --icons=always --group-directories-first";
			ll = "eza --color=always --icons=always --group-directories-first --all --long";
                        lf = "cd \"$(command lf -print-last-dir $argv)\"";

			vi = "nvim";
			vim = "nvim";

			c = "clear";
			h = "history";
			grep = "grep --color=auto";
			ping = "ping -c 50 -i .2";
			mkdir = "mkdir --parents";

			rm = "rm -I --preserve-root";
			mv = "mv -i";
			cp = "cp -i";
			ln = "ln -i";

                        newsraft = "newsraft -f $HOME/notes/rss";
                        ani-cli = "ani-cli --skip";
		};
	};

}
