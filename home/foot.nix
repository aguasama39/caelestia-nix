{ config, pkgs, ... }:

{
  programs.foot.enable = true;

  xdg.configFile."foot/foot.ini".text = ''
    include=~/.local/state/caelestia/theme/foot.ini

    [main]
    font=CaskaydiaCove Nerd Font Mono:size=11
    shell=fish
    pad=8x8

    [scrollback]
    lines=10000

    [cursor]
    style=beam

    [mouse]
    hide-when-typing=yes
  '';

  xdg.configFile."caelestia/templates/foot.ini".text = ''
    [colors]
    foreground={{ onSurface.hex }}
    background={{ surface.hex }}
    regular0={{ term0.hex }}
    regular1={{ term1.hex }}
    regular2={{ term2.hex }}
    regular3={{ term3.hex }}
    regular4={{ term4.hex }}
    regular5={{ term5.hex }}
    regular6={{ term6.hex }}
    regular7={{ term7.hex }}
    bright0={{ term8.hex }}
    bright1={{ term9.hex }}
    bright2={{ term10.hex }}
    bright3={{ term11.hex }}
    bright4={{ term12.hex }}
    bright5={{ term13.hex }}
    bright6={{ term14.hex }}
    bright7={{ term15.hex }}
  '';
}
