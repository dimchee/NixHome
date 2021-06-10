{ config, pkgs, ... }:
let
  neuronSrc = builtins.fetchTarball "https://github.com/srid/neuron/archive/master.tar.gz";
in
{
  nix.extraOptions = ''
    plugin-files = ${pkgs.nix-doc}/lib/libnix_doc_plugin.so
  '';

  imports = [./vim ./emacs.nix ];
  environment.systemPackages = with pkgs; [
    nix-doc
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
    (import neuronSrc).default
  ];
}
