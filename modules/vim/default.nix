{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
  nvim_overlay = builtins.fetchTarball "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
  my-nvim = unstable.symlinkJoin {
    name = "nvim-my-nightly";
    paths = [ unstable.neovim ];
    buildInputs = [ unstable.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/nvim --set XDG_CONFIG_HOME $out/etc
      ln -s $out/bin/nvim $out/bin/vim
      mkdir -p $out/etc/nvim
      # ln -s ${toString ./lua}  $out/etc/nvim/lua
      # ln -s ${toString ./plugin}  $out/etc/nvim/plugin
      # ln -s ${toString ./init.lua}  $out/etc/nvim/init.lua
      # Not working couse of flakes (first copy to store, then builds)
      # This is quick and dirty fix
      ln -s /home/dimchee/NixHome/modules/vim/lua  $out/etc/nvim/lua
      ln -s /home/dimchee/NixHome/modules/vim/plugin  $out/etc/nvim/plugin
      ln -s /home/dimchee/NixHome/modules/vim/init.lua  $out/etc/nvim/init.lua
      mkdir -p $out/etc/nvim/parser
      cp ${unstable.tree-sitter.builtGrammars.tree-sitter-c}/parser $out/etc/nvim/parser/c.so
      cp ${unstable.tree-sitter.builtGrammars.tree-sitter-nix}/parser $out/etc/nvim/parser/nix.so
      cp ${unstable.tree-sitter.builtGrammars.tree-sitter-rust}/parser $out/etc/nvim/parser/rust.so
      cp ${unstable.tree-sitter.builtGrammars.tree-sitter-go}/parser $out/etc/nvim/parser/go.so
      cp ${unstable.tree-sitter.builtGrammars.tree-sitter-lua}/parser $out/etc/nvim/parser/lua.so
      cp ${unstable.tree-sitter.builtGrammars.tree-sitter-python}/parser $out/etc/nvim/parser/python.so
      cp ${unstable.tree-sitter.builtGrammars.tree-sitter-zig}/parser $out/etc/nvim/parser/zig.so
      cp ${unstable.tree-sitter.builtGrammars.tree-sitter-latex}/parser $out/etc/nvim/parser/latex.so
      cp ${unstable.tree-sitter.builtGrammars.tree-sitter-julia}/parser $out/etc/nvim/parser/julia.so
    '';
  };
in
{
  nixpkgs.overlays = [ (import nvim_overlay) ];
  environment.systemPackages = with unstable; [
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
  ];
  #xdg.dataFile."nvim/site/pack/packer/start/telescope-fzf-native.nvim/build/libfzf.so".source = "${unstable.telescope-fzf-native}/build/libfzf.so";
  #xdg.configFile."nvim/parser/c.so".source = "${unstable.tree-sitter.builtGrammars.tree-sitter-c}/parser";
  #xdg.configFile."nvim/parser/lua.so".source = "${unstable.tree-sitter.builtGrammars.tree-sitter-lua}/parser";
  #xdg.configFile."nvim/parser/rust.so".source = "${unstable.tree-sitter.builtGrammars.tree-sitter-rust}/parser";
  #xdg.configFile."nvim/parser/python.so".source = "${unstable.tree-sitter.builtGrammars.tree-sitter-python}/parser";
}
