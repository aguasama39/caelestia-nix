{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/reinas/Music";
    network.listenAddress = "127.0.0.1";

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire"
      }
    '';
  };

  programs.rmpc = {
    enable = true;
  };

}
