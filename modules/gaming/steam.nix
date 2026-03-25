{ pkgs, lib, config, ... }: {

	options.modules.gaming.steam.enable = lib.mkEnableOption "Enables Steam";

	config = lib.mkIf config.modules.gaming.steam.enable {
                programs = {
                        steam = {
                                enable = true;
                                gamescopeSession.enable = true;
                                extraCompatPackages = with pkgs; [
                                        proton-ge-bin
                                        steamtinkerlaunch
                                ];
                                # remotePlay.openFirewall = true; # Open ports for Steam Remote Play
                                # dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server
                        };
                        gamemode.enable = true;
                };

                # Automatically launch steam when a controller is connected
                systemd.user.services.controller-autolaunch = {
                        enable = true;
                        description = "Launch steam";
                        serviceConfig = {
                                # Type = "simple";
                                ExecStart = "${pkgs.steam}/bin/steam -bigpicture";
                                # Restart = "on-failure";
                                # RestartSec = "5s";
                        };
                };
                services.udev.extraRules = ''
                        TAG+="systemd", ACTION=="add", KERNEL=="js*", SUBSYSTEM=="input", ENV{SYSTEMD_USER_WANTS}+="controller-autolaunch.service"
                '';

                # Enable OpenGL/Vulkan
                services.xserver.videoDrivers = [ "amdgpu" ];
                hardware.graphics = {
                        enable = true;
                        enable32Bit = true; # Crucial for running 32-bit games (like Wine/Proton)
                };

                environment.systemPackages = with pkgs; [
                        mangohud
                ];
	};

}
