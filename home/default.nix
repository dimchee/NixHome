{pkgs, lib, inputs, ...}:
{
  nixpkgs.overlays = [ (import ./leiningen.nix) ];
  imports = [
    ./desktop.nix ./gui.nix
  ];
  home.packages = with pkgs; [
    inputs.neovim.packages.x86_64-linux.nvim
    # inputs.lean4.packages.x86_64-linux
    elan mathlibtools
    arduino-cli
    # discord
    fondo
    gcc
    godot
    julia-stable-bin
    koka
    libnotify
    lutris
    pinta
    pplatex
    python
    shortwave
    sqlitebrowser
    teams
    gnome.totem
    wasm3
    wofi
    xorg.xeyes
    gnumake
    inputs.invicli.defaultPackage.x86_64-linux
    (import ./juniper.nix pkgs)
    clojure clojure-lsp leiningen
  ];
  programs.home-manager = {
    enable = true;
  };
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # xsession.windowManager.xmonad = {
  #   enable = true;
  #   config = ../../Xmonad/Config.hs;
  #   extraPackages = [];
  # };
  # when not working run: nix-shell '<home-manager>' -A install
  programs.bash = {
    enable = true;
    shellAliases.home-manager = "home-manager --flake $NIX_HOME";
    bashrcExtra = ''
      [ -f .bash_completion ] && source .bash_completion # for arduino-cli
      PATH=$PATH:~/Nix/Kod/
    '';
  };
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "android-studio-stable"
    "teams" "discord"
    "steam" "steam-original" "steam-runtime"
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "libgit2-0.27.10"
  ];

}
