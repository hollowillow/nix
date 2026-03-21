{ pkgs, lib, config, ... }: {

        options.modules.gaming.retroarch.enable = lib.mkEnableOption "Enables Retroarch";

        config = lib.mkIf config.modules.gaming.retroarch.enable {
                environment.systemPackages = with pkgs; [
                        (retroarch.withCores ( cores: with cores; [
                                mupen64plus # nintendo 64
                                dolphin # gamecube, wii
                                flycast # dreamcast
                                beetle-psx-hw # PS1
                                pcsx2 # PS2
                        ]))
                ];
        };

}
