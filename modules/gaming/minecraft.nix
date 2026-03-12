{ pkgs, lib, config, inputs, ... }: {

        options.modules.gaming.minecraft.enable = lib.mkEnableOption "Enables Discord";

        config = lib.mkIf config.modules.gaming.minecraft.enable {
                environment.systemPackages = with pkgs; [
                        inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher
                        jdk8
                        jdk17
                        jdk21
                ];
        };

}
