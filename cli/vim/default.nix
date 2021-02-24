{ config, pkgs, ... }:
let
  jupyter-vim = pkgs.vimUtils.buildVimPlugin {
    name = "jupyter-vim";
    src = pkgs.fetchFromGitHub {
      owner = "broesler";
      repo = "jupyter-vim";
      rev = "9912e792ec3037fb87b68552811c7cf0d8e902c4";
      sha256 = "1cqvpc1xh5h93mbinzcmhy8h8m7f3lrnmsx86ifz73b8fv9lk6dw"; 
    };
  };
  pkg = with pkgs.vimPlugins; [
    fzf-vim
    coc-nvim
    haskell-vim hoogle
    julia-vim
    agda-vim
    vim-nix
    gruvbox
    vim-airline
  ];
  nvim = pkgs.neovim.override {
    vimAlias = true;
    configure = {
      packages.myPlugins.start = pkg; 
      customRC = "source /home/dimchee/NixHome/cli/vim/vimrc";
    };
  };
  nvim-nightly = pkgs.neovim-nightly.override {
    vimAlias = true;
  };
in
{ 
   environment.systemPackages = [ nvim pkgs.nodejs ]; # nvim-nightly ];
} 
