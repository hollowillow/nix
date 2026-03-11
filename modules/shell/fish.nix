{ pkgs, lib, config, ... }: {

	options.modules.shell.fish.enable = lib.mkEnableOption "Enables fish shell";

	config = lib.mkIf config.modules.shell.fish.enable {
		users.defaultUserShell = pkgs.fish;
		programs = {
			fish = {
				enable = true;
				generateCompletions = true;
                                interactiveShellInit = ''
                                        set fish_greeting
                                        if command -v zoxide >/dev/null 2>&1
                                                eval "$(zoxide init --cmd cd fish)"
                                        end
                                        if command -v atuin >/dev/null 2>&1
                                                eval "$(atuin init fish)"
                                        end
                                        if command -v fzf >/dev/null 2>&1
                                                eval "$(fzf --fish)"
                                        end
                                '';
			};
			zoxide = {
				enable = true;
				enableFishIntegration = true;
			};
			starship = {
				enable = true;
				interactiveOnly = true;
				transientPrompt = {
					enable = true;
				};
			};
		};
		services.atuin = {
			enable = true;
			database.createLocally = true;
		};
	};

}
