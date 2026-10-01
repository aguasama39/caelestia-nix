{ ... }:

{
  # Hyprland 0.55+ uses Lua configuration.
  # Hyprland itself is enabled system-wide in configuration.nix.
  xdg.configFile."hypr/hyprland.lua".text = ''
    local terminal = "foot"
    local browser = "zen"

    hl.monitor({
      output = "",
      mode = "preferred",
      position = "auto",
      scale = 1,
    })

    hl.config({
      general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        layout = "dwindle",
      },

      decoration = {
        rounding = 10,
        blur = {
          enabled = true,
          size = 8,
          passes = 3,
        },
      },

      input = {
        kb_layout = "us",
        follow_mouse = 1,
      },

      misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
      },
    })

    hl.on("hyprland.start", function()
      hl.exec_cmd("caelestia shell -d")
    end)

    hl.bind("SUPER + SUPER_L", hl.dsp.global("caelestia:launcher"), { release = true })
    hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
    hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
    hl.bind("SUPER + Q", hl.dsp.window.close())
    hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("caelestia screenshot"))
  '';
}
