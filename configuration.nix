{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/bluetooth.nix
    ./modules/drives.nix
    ./modules/fish.nix
    ./modules/flatpak.nix
    ./modules/nvidia.nix
    ./modules/packages.nix
    ./modules/system.nix
    ./modules/login.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";

  users.users.paulcho = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };

  programs.hyprland.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
