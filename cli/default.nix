{ config, pkgs, ... }:
{
  imports = [./vim ];
  environment.systemPackages = with pkgs; [
    wget tree file
    ntfs3g
    git fzf bat
    ripgrep
    tldr
    niv lorri direnv
    gotop
    youtube-dl
    mpc_cli ncmpcpp
    jq go-pup # html scraper
    zip unzip
    ffmpeg imagemagick
  ];
}
