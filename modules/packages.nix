{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    curl

    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    foot

    fish
    starship

    rmpc
    mpc
    mpd

    thunar
    xfce.thunar-archive-plugin

    fastfetch
    pciutils
    nano
    ffmpeg
    cifs-utils
    unrar
    proton-vpn-cli
    gearlever
    nicotine-plus
    pavucontrol



    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.iosevka-term
  ];
}
