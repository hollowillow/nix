{ pkgs, lib, config, ... }: {

	options.modules.network.bluetooth.enable = lib.mkEnableOption "Enables bluetooth configuration";

	config = lib.mkIf config.modules.network.bluetooth.enable {
		hardware.bluetooth = {
			enable = true;
			powerOnBoot = true;
		};
		services.blueman.enable = true;
		systemd.user.services.mpris-proxy = {
			enable = true;
			after = [ "bluetooth.service" ];
			wantedBy = [ "default.target" ];
		};
	};

}
