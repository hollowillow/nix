{ pkgs, lib, config, ... }: {

	options.modules.system.pipewire.enable = lib.mkEnableOption "Enables sound config";

	config = lib.mkIf config.modules.system.pipewire.enable {
		services.pipewire = {
			enable = true;
			pulse.enable = true;
			alsa.enable = true;
			wireplumber.enable = true;
		};
		environment.systemPackages = with pkgs; [
			qpwgraph
		];
	};

}
