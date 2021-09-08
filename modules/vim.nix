{ config, pkgs, inputs, ... }:
let
  my-nvim = pkgs.symlinkJoin {
    name = "nvim-my-nightly";
    paths = [ pkgs.neovim ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/nvim --set XDG_CONFIG_HOME $out/etc
      ln -s $out/bin/nvim $out/bin/vim
      mkdir -p $out/etc/nvim
      # ln -s ${toString ./lua}  $out/etc/nvim/lua
      # ln -s ${toString ./plugin}  $out/etc/nvim/plugin
      # ln -s ${toString ./init.lua}  $out/etc/nvim/init.lua
      # Not working couse of flakes (first copy to store, then builds)
      # This is quick and dirty fix
      ln -s /home/dimchee/NixHome/home/vim/lua  $out/etc/nvim/lua
      ln -s /home/dimchee/NixHome/home/vim/plugin  $out/etc/nvim/plugin
      ln -s /home/dimchee/NixHome/home/vim/init.lua  $out/etc/nvim/init.lua
      mkdir -p $out/etc/nvim/parser
      cp ${pkgs.tree-sitter.builtGrammars.tree-sitter-c}/parser $out/etc/nvim/parser/c.so
      cp ${pkgs.tree-sitter.builtGrammars.tree-sitter-nix}/parser $out/etc/nvim/parser/nix.so
      cp ${pkgs.tree-sitter.builtGrammars.tree-sitter-rust}/parser $out/etc/nvim/parser/rust.so
      cp ${pkgs.tree-sitter.builtGrammars.tree-sitter-go}/parser $out/etc/nvim/parser/go.so
      cp ${pkgs.tree-sitter.builtGrammars.tree-sitter-lua}/parser $out/etc/nvim/parser/lua.so
      cp ${pkgs.tree-sitter.builtGrammars.tree-sitter-python}/parser $out/etc/nvim/parser/python.so
      cp ${pkgs.tree-sitter.builtGrammars.tree-sitter-zig}/parser $out/etc/nvim/parser/zig.so
      cp ${pkgs.tree-sitter.builtGrammars.tree-sitter-latex}/parser $out/etc/nvim/parser/latex.so
      cp ${pkgs.tree-sitter.builtGrammars.tree-sitter-julia}/parser $out/etc/nvim/parser/julia.so
    '';
  };
in
{
  nixpkgs.overlays = [ inputs.neovim.overlay ];
  environment.systemPackages = with pkgs; [
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
    
    neovim-remote
    my-nvim
    inputs.neuron.packages.x86_64-linux.neuron
  ];
}
