{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget

    brave
    foot

    fish
    starship

    rmpc
    mpc-cli
    mpd
    playerctl

    thunar
    xfce.thunar-archive-plugin
    file-roller

    wl-clipboard
    cliphist
    brightnessctl
    pavucontrol
    networkmanagerapplet
    blueman

    fastfetch
    btop
    ripgrep
    jq
    unzip

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.iosevka-term
  ];
}
