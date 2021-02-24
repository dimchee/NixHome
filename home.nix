{ config, pkgs, ... }:
let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "209566c752c4428c7692c134731971193f06b37c";
    ref = "release-20.09";
  };
in
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  imports = [
    (import "${home-manager}/nixos")
  ];
  home-manager.users.dimchee = {
    programs.home-manager.enable = true;
    programs.neovim = {
      enable = true;
      vimAlias = true;
      package = pkgs.neovim-nightly;
      extraConfig = "source /home/dimchee/NixHome/cli/vim/vimrc";
      plugins = with pkgs.vimPlugins; [
        fzf-vim
        coc-nvim
        haskell-vim hoogle
        julia-vim
        agda-vim
        vim-nix
        gruvbox
        vim-airline
      ];
      extraPackages = with pkgs; [
        gopls
        neovim-remote
        nodejs
      ];
    };
  };
}
