{ pkgs, lib, config, ... }: {

	options = {
		modules.system.fonts.enable = lib.mkEnableOption "Enables font module";
	};

	config = lib.mkIf config.modules.system.fonts.enable {
		fonts= {
			packages = with pkgs; [
				noto-fonts
				nerd-fonts.hasklug
				nerd-fonts.caskaydia-mono
				ipaexfont
			];
			fontconfig = {
				enable = true;
				defaultFonts = {
					serif = [ "CaskaydiaMono NF" "IPAexGothic" ];
					sansSerif = [ "CaskaydiaMono NF" "IPAexGothic" ];
					monospace = [ "Hasklug Nerd Font Mono Sembd" ];
					# emoji = [];
				};
			};
	  	};
	};

}
