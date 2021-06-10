{ config, pkgs, ... }:
{
  imports = [ ./zathura ];
  environment.systemPackages = with pkgs; [
    alacritty
    firefox-wayland
    discord
    # blender
    inkscape
    imv mpv
    vlc
    gimp
    libreoffice
    vscodium
    # (callPackage ./alacritty {})
  ];
}
