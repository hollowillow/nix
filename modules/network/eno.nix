{ pkgs, lib, config, ... }: {

	options.modules.network.eno.enable = lib.mkEnableOption "Enables wired network configuration";

	config = lib.mkIf config.modules.network.eno.enable {
  		networking = {
			interfaces.eno1 = {
				ipv4.addresses = [{
					address = "192.168.0.110";
					prefixLength = 24;
				}];
			};
			defaultGateway = {
				address = "192.168.0.1";
				interface = "eno1";
			};
			nameservers = [
				"1.1.1.1"
				"8.8.8.8"
			];
			networkmanager.enable = true;
  		};
	};

}
