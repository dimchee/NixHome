{ config, pkgs, lib, ... }:
let
  unstable = import <nixos-unstable> {};
  configDir = "/home/dimchee/NixHome/";
  nixFlakes = with pkgs; writeShellScriptBin "nixFlakes" ''
    exec ${nixUnstable}/bin/nix --experimental-features "flakes" "$@"
  '';
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "f5adb9be829f487f99bcc0f1884f74ddb85f70c8";
    ref = "release-21.05";
  };
in {
  imports =
    [
      # (import "${home-manager}/nixos")
      ./hardware/alvearium.nix
      ./modules/cli.nix ./modules/gnome.nix ./modules/dev
    ];
  # programs.sway.enable = true;
  # programs.waybar.enable = false;
  # home-manager.users.dimchee = import ./home.nix;
  # home-manager.useGlobalPkgs = true;
  environment.variables.NIXOS_CONFIG = configDir + "configuration.nix";
  security.sudo.extraConfig = "Defaults env_keep+=NIXOS_CONFIG";

  time.timeZone = "Europe/Belgrade";

  networking.useDHCP = false;
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ]; # gsconnect
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ]; # gsconnect
  networking.firewall.allowedTCPPorts = [ 80 8888 ];

  programs.adb.enable = true;     # adbusers group
  programs.light.enable = true;   # video group
  programs.gphoto2.enable = true; # camera group
  
  users.users.dimchee = {
    isNormalUser = true;
    extraGroups = [
      "wheel" "video" "dialout" "adbusers" "networkmanager"
    ];
  };

  # Gaming
  programs.steam.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam" "steam-original" "steam-runtime"
  ];
  environment.systemPackages = with pkgs; [
    lutris nixFlakes
    firefox
    alacritty
    cage cachix
  ];
  environment.variables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    PATH = "$PATH:$HOME/Code/scripts";
  };


  #services.gvfs.enable = true; # problems with trash, android mount?

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      font-awesome ubuntu_font_family
      (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
    ];
    #fontconfig.defaultFonts = {
    #  sansSerif = [ "Ubuntu" ];
    #  monospace = [ "Iosevka Nerd Font Mono" ];
    #  emoji = [ "Font Awesome Free" ];
    #};
  };

  system.stateVersion = "21.05";
}

