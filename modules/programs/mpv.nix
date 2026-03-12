{ pkgs, lib, config, ... }: {

        options.modules.programs.mpv.enable = lib.mkEnableOption "Enables mpv";

        config = lib.mkIf config.modules.programs.mpv.enable {
                environment.systemPackages = with pkgs; [
                        (mpv.override { 
                                # User scripts
                                scripts = with mpvScripts; [
                                        uosc
                                        thumbfast
                                        mpris
                                ];
                                # Support for additional file formats
                                # mpv-unwrapped = pkgs.mpv-unwrapped.override {
                                #         ffmpeg = pkgs.ffmpeg-full;
                                # };
                        })
                        # Online playback
                        mpv-handler
                        yt-dlp
                ];
                environment.etc."mpv/script-opts/thumbfast.conf".text = ''
                        network=yes
                '';
                environment.etc."mpv/mpv.conf".text = ''
                        osd-bar=no
                '';
        };

}
