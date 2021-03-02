{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alacritty
    firefox-wayland
    discord
    # blender
    # inkscape
    imv mpv
    vlc
    gimp
    libreoffice
    zathura
    vscodium
  ];
}
