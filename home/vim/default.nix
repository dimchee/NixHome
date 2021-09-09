{ pkgs, ... }:
let unstable = import<nixos-unstable>{};
  mkSymlink = path: pkgs.runCommandLocal (baseNameOf path + "-link") {} ''
    ln -s ${toString path} $out
  '';
  getGrammar = name: "${with unstable.tree-sitter.buildGrammars; name}/parser";
  getNvimTS = lang : xdg.configFile."nvim/parser/${lang}.so".source;
in {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  home.packages = with pkgs; [
    neovim-nightly
    
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
  xdg.configFile."nvim/lua".source = mkSymlink ./lua;
  xdg.configFile."nvim/init.lua".source = mkSymlink ./init.lua;
  programs.bash.shellAliases.vim = "nvim";

  #(getNvimTS "c") = getGrammar tree-sitter-c;
  xdg.configFile."nvim/parser/c.so".source      = "${unstable.tree-sitter.builtGrammars.tree-sitter-c}/parser";
  xdg.configFile."nvim/parser/nix.so".source    = "${unstable.tree-sitter.builtGrammars.tree-sitter-nix}/parser";
  xdg.configFile."nvim/parser/rust.so".source   = "${unstable.tree-sitter.builtGrammars.tree-sitter-rust}/parser";
  xdg.configFile."nvim/parser/go.so".source     = "${unstable.tree-sitter.builtGrammars.tree-sitter-go}/parser";
  xdg.configFile."nvim/parser/lua.so".source    = "${unstable.tree-sitter.builtGrammars.tree-sitter-lua}/parser";
  xdg.configFile."nvim/parser/python.so".source = "${unstable.tree-sitter.builtGrammars.tree-sitter-python}/parser";
  xdg.configFile."nvim/parser/zig.so".source    = "${unstable.tree-sitter.builtGrammars.tree-sitter-zig}/parser";
  xdg.configFile."nvim/parser/latex.so".source  = "${unstable.tree-sitter.builtGrammars.tree-sitter-latex}/parser";
  xdg.configFile."nvim/parser/julia.so".source  = "${unstable.tree-sitter.builtGrammars.tree-sitter-julia}/parser";
  xdg.configFile."nvim/parser/markdown.so".source  = "${unstable.tree-sitter.builtGrammars.tree-sitter-markdown}/parser";
  xdg.configFile."nvim/parser/bash.so".source   = "${unstable.tree-sitter.builtGrammars.tree-sitter-bash}/parser";
} 
