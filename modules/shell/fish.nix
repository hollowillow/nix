{ pkgs, lib, config, ... }: {

	options.modules.shell.fish.enable = lib.mkEnableOption "Enables fish shell";

	config = lib.mkIf config.modules.shell.fish.enable {
		users.defaultUserShell = pkgs.fish;
		programs = {
			fish = {
				enable = true;
				generateCompletions = true;
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
