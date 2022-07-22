{ config, pkgs, ... }:
{
  # imports = [ ./vim.nix ]; # using home-manager now
  environment.systemPackages = with pkgs; [
    wget tree file
    ntfs3g
    git bat
    fzf ripgrep
    tldr # cli help
    gotop
    youtube-dl
    mpc_cli ncmpcpp # music using mpd
    jq pup # html scraper
    zip unzip
    ffmpeg imagemagick
    #pandoc
    tectonic graphviz
  ];
  programs.bash.shellAliases.pandoc = "pandoc --pdf-engine=tectonic";
}
