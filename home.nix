{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ./home/foot.nix
    ./home/hyprland.nix
    ./home/mpd.nix
  ];

  home.username = "paulcho";
  home.homeDirectory = "/home/paulcho";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  programs.starship.enable = true;

  programs.caelestia = {
    enable = true;
    systemd.enable = false;

    cli = {
      enable = true;
      settings.theme.enableGtk = true;
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
    '';
  };

  home.sessionVariables = {
    TERMINAL = "foot";
    BROWSER = "brave";
  };
}
