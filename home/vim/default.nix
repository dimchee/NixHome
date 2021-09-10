{ pkgs, ... }:
let
  drop = n: l: if n > 0 then drop (n - 1) (builtins.tail l) else l; 
  getRelPathString = path: builtins.concatStringsSep "/" (drop 4 (
    builtins.filter builtins.isString (builtins.split "/" (toString path))
  ));
  getPathString = path: (builtins.getEnv "NIX_HOME") + (getRelPathString path);
  mkSymlink = path: pkgs.runCommandLocal (baseNameOf path + "-link") {} ''
    ln -s ${getPathString path} $out
  '';
  addTSNvim = lang: {
    "nvim/parser/${lang}.so".source =
      "${pkgs.tree-sitter.builtGrammars."tree-sitter-${lang}"}/parser";
  };
  getTSNvim = list : builtins.foldl' (x: y: x // y) {} (map addTSNvim list);
in {
  #nixpkgs.overlays = [
  #  (import (builtins.fetchTarball {
  #    url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #  }))
  #];
  home.packages = with pkgs; [
    neovim
    
    haskellPackages.haskell-language-server
    nodePackages.pyright
    elmPackages.elm-language-server
    rust-analyzer
    ccls
    gopls
    texlab
    rnix-lsp
    sumneko-lua-language-server
    zls
    neuron
    # neovim-remote
  ];
  
  xdg.configFile = (getTSNvim [
    "c" "nix" "rust" "go" "lua" "python" "zig" "latex" "julia" "bash" "markdown"
  ]) // {
    "nvim/lua".source = mkSymlink ./lua;
    "nvim/init.lua".source = mkSymlink ./init.lua;
  };
  programs.bash.shellAliases.vim = "nvim";
} 
