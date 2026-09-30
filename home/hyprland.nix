{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        "caelestia shell -d"
      ];

      bind = [
        "SUPER, T, exec, foot"
        "SUPER, B, exec, zen"
        "SUPER, Q, killactive"
        "SUPER SHIFT, S, exec, caelestia screenshot"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 8;
          passes = 3;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
      };
    };
  };
}
