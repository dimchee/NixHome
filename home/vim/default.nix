{ pkgs, nix-home, inputs,... }:
let
  drop = n: l: if n > 0 then drop (n - 1) (builtins.tail l) else l; 
  getRelPathString = path: builtins.concatStringsSep "/" (drop 4 (
    builtins.filter builtins.isString (builtins.split "/" (toString path))
  ));
  getPathString = path: nix-home + "/" + (getRelPathString path);
  mkSymlink = path: pkgs.runCommandLocal (baseNameOf path + "-link") {} ''
    ln -s ${getPathString path} $out
  '';
  addTSNvim = lang: {
    "nvim/parser/${lang}.so".source =
      "${pkgs.tree-sitter.builtGrammars."tree-sitter-${lang}"}/parser";
  };
  getTSNvim = list : builtins.foldl' (x: y: x // y) {} (map addTSNvim list);
in {
  nixpkgs.overlays = [
    inputs.neovim.overlay
    # (import ./ccls.nix)
  ];
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
    inputs.neuron.packages.x86_64-linux.neuron
    neovim-remote
  ];
  
  xdg.configFile = (getTSNvim [
    "c" "nix" "rust" "go" "lua" "python" "zig" "latex" "julia" "bash" "markdown"
    "haskell" "agda" "ocaml" "toml" "javascript" "html" "json"
  ]) // {
    "nvim/lua".source = mkSymlink ./lua;
    "nvim/init.lua".source = mkSymlink ./init.lua;
  };
  programs.bash.shellAliases.vim = "nvim";
} 
