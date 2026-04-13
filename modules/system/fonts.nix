{ pkgs, lib, config, ... }: {

	options = {
		modules.system.fonts.enable = lib.mkEnableOption "Enables font module";
	};

	config = lib.mkIf config.modules.system.fonts.enable {
		fonts= {
			packages = with pkgs; [
				noto-fonts # compat
				nerd-fonts.hasklug # term
				ipaexfont # jap
			];
			fontconfig = {
				enable = true;
				defaultFonts = {
					serif = [ "Hasklug Nerd Font Propo" "IPAexGothic" "Noto Sans Regular" ];
					sansSerif = [ "Hasklug Nerd Font Propo" "IPAexGothic" "Noto Serif Regular" ];
					monospace = [ "Hasklug Nerd Font Mono Sembd" "Noto Sans Mono Regular" ];
					# emoji = [];
				};
			};
	  	};
	};

}
