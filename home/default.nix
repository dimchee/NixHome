{pkgs, lib, inputs, ...}:
{
  imports = [
    ./desktop.nix ./gui.nix ./vim
  ];
  home.packages = with pkgs; [
    # inputs.lean4.packages.x86_64-linux
    discord
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
  ];
  programs.home-manager = {
    enable = true;
  };
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.direnv.nix-direnv.enableFlakes = true;

  programs.bash = {
    enable = true;
    shellAliases.home-manager = "home-manager --flake $NIX_HOME";
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
