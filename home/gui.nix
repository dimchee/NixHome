{ pkgs, ... }:
{
  #nixpkgs.overlays = [ (import ./webcamoid.nix) ];
  imports = [ ./zathura.nix ./alacritty.nix ];
  home.packages = with pkgs; [
    firefox-wayland
    chromium
    # discord
    # blender
    # inkscape
    # gimp
    imv mpv
    # vlc
    # libreoffice
    vscodium
    webcamoid
    teams
  ];
}
