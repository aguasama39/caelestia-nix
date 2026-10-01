{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ./home/foot.nix
    ./home/hyprland.nix
    ./home/mpd.nix
    ./home/zen-theme.nix
  ];

  home.username = "paulcho";
  home.homeDirectory = "/home/paulcho";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  programs.starship.enable = true;

  programs.caelestia = {
    enable = true;

    # Hyprland's Lua config starts Caelestia on session startup.
    systemd.enable = false;

    cli = {
      enable = true;
      settings.theme = {
        enableGtk = true;
        enableQt = true;
        enableChromium = true;
        postHook = "zen-theme-sync";
      };
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      starship init fish | source
      fastfetch
    '';
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  home.sessionVariables = {
    TERMINAL = "foot";
    BROWSER = "zen";
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };
}
