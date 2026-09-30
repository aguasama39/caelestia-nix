{ pkgs, ... }:

{
  programs.fish.enable = true;
  users.users.paulcho.shell = pkgs.fish;
}
