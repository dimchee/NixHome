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
      ./vim ./gnome
    ];
  # home-manager.users.dimchee = import ./home.nix;
  # home-manager.useGlobalPkgs = true;
  environment.variables.NIXOS_CONFIG = configDir + "configuration.nix";
  security.sudo.extraConfig = "Defaults env_keep+=NIXOS_CONFIG";

  #boot.plymouth.enable = true;
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda"; # or "nodev" for efi only
  };

  time.timeZone = "Europe/Belgrade";
  networking.hostName = "alvearium";

  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ]; # gsconnect
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ]; # gsconnect

  
  users.users.dimchee = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # Gaming
  programs.steam.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam" "steam-original" "steam-runtime"
  ];
  environment.systemPackages = with pkgs; [
    lutris nixFlakes
    wget git ntfs3g ripgrep
    firefox
    alacritty
  ];

  #services.gvfs.enable = true; # problems with trash, android mount?

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      font-awesome
       (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
    ];
  };

  system.stateVersion = "21.05";
}

