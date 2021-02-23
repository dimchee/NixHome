{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alacritty
    firefox-wayland
    discord
    # blender
    # inkscape
    gimp
    libreoffice
    zathura
    vscodium
  ];
}
