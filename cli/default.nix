{ config, pkgs, ... }:
{
  imports = [./vim ];
  environment.systemPackages = with pkgs; [
    wget
    tree
    file
    ntfs3g
    git
    feh
    mpv
    niv
    lorri
    direnv
    fzf
    lsd
    gotop
    youtube-dl
    mpc_cli
    ncmpcpp
    jq
    tldr
    zip unzip
    ripgrep
    ffmpeg
    imagemagick
    go-pup # html scraper
  ];
}
