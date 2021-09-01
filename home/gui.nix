{ pkgs, ... }:
{
  imports = [ ./zathura.nix ./alacritty.nix ];
  home.packages = with pkgs; [
    firefox-wayland
    # discord
    # blender
    # inkscape
    # gimp
    imv mpv
    vlc
    libreoffice
    vscodium
  ];
}
