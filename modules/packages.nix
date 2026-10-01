{ pkgs, inputs, ... }:

let
  cmatrix-git = pkgs.callPackage ../packages/cmatrix-git.nix {
    cmatrix-src = inputs.cmatrix-src;
  };
in
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
    thunar-archive-plugin

    fastfetch
    cmatrix-git
    cbonsai
    pciutils
    nano
    ffmpeg
    cifs-utils
    unrar
    unzip
    zip
    proton-vpn-cli
    gearlever
    nicotine-plus
    pavucontrol
    glib
    gsettings-desktop-schemas



    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];
}
