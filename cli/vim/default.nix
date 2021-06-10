{ config, pkgs, ... }:
let
  neovim-overlay = builtins.fetchTarball {
    url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  };
  my-nvim = pkgs.symlinkJoin {
    name = "nvim-my-nightly";
    paths = [ pkgs.neovim-nightly ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/nvim --set XDG_CONFIG_HOME $out/etc
      ln -s $out/bin/nvim $out/bin/vim
      mkdir -p $out/etc/
      ln -s ${toString ./.}  $out/etc/nvim
    '';
  };
in
{
  nixpkgs.overlays = [ (import neovim-overlay) ];
  environment.systemPackages = with pkgs; [
    haskellPackages.haskell-language-server
    nodePackages.bash-language-server
    nodePackages.pyright
    elmPackages.elm-language-server
    rust-analyzer
    ccls
    gopls
    neovim-remote
    texlab
    rnix-lsp
    my-nvim
  ];
}
