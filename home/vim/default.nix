{ pkgs, ... }:
let unstable = import<nixos-unstable>{};
in {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly; 
    vimAlias = true;
    extraPackages = with pkgs; [
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
      # neovim-remote
    ];
    extraConfig = ''
    lua << EOF
    ${builtins.readFile ./init.lua}
    EOF
    '';
  };
  xdg.configFile."nvim/lua".source = ./lua;
  xdg.configFile."nvim/lua".recursive = true;

  xdg.configFile."nvim/parser/c.so".source      = "${unstable.tree-sitter.builtGrammars.tree-sitter-c}/parser";
  xdg.configFile."nvim/parser/nix.so".source    = "${unstable.tree-sitter.builtGrammars.tree-sitter-nix}/parser";
  xdg.configFile."nvim/parser/rust.so".source   = "${unstable.tree-sitter.builtGrammars.tree-sitter-rust}/parser";
  xdg.configFile."nvim/parser/go.so".source     = "${unstable.tree-sitter.builtGrammars.tree-sitter-go}/parser";
  xdg.configFile."nvim/parser/lua.so".source    = "${unstable.tree-sitter.builtGrammars.tree-sitter-lua}/parser";
  xdg.configFile."nvim/parser/python.so".source = "${unstable.tree-sitter.builtGrammars.tree-sitter-python}/parser";
  xdg.configFile."nvim/parser/zig.so".source    = "${unstable.tree-sitter.builtGrammars.tree-sitter-zig}/parser";
  xdg.configFile."nvim/parser/latex.so".source  = "${unstable.tree-sitter.builtGrammars.tree-sitter-latex}/parser";
  xdg.configFile."nvim/parser/julia.so".source  = "${unstable.tree-sitter.builtGrammars.tree-sitter-julia}/parser";
}
