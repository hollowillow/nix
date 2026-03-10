{ pkgs, lib, config, ... }: {

	options.modules.system.user.enable = lib.mkEnableOption "Enables default user config";

	config = lib.mkIf config.modules.system.user.enable {
  		users.users.hollowillow = {
    			isNormalUser = true;
    			extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
			shell = pkgs.zsh;
  		};
		programs.zsh.enable = true;
	};

}

