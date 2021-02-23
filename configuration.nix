{ config, pkgs, ... }:
let
  home-manager = builtins.fetchFromGitHub {
    owner = "rycee";
    repo = "home-manager";
    rev = "7582090eb0f64144995d4fb9d5e52343e2c3f64b";
    sha256 = "10a3yvazpdpv1sj00w9a1mswy5y8pzsjd4gsfnbgd7ygijqybr9i";
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    # <home-manager/nixos> # https://rycee.gitlab.io/home-manager/index.html#sec-install-nixos-module
    ./desk ./cli ./dev ./gui
  ];

  nix.extraOptions = ''
    keep-outputs = true
    binary-caches-parallel-connections = 4
    connect-timeout = 5
  '';
  nix.binaryCaches        = ["https://cache.nixos.org"];
  nix.trustedBinaryCaches = ["https://cache.nixos.org"];
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  #boot.loader.grub = {
  #  enable = true;
  #  device = "/dev/sda";
  #  efiSupport = true;
  #  splashImage = "/etc/nixos/dotfiles/bg/Suma.png";
  #  forcei686 = true;
  #};

  # Power auto tuning for longer battery life
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
  powerManagement.scsiLinkPolicy = "med_power_with_dipm";

  # Enable Unfree software
  nixpkgs.config.allowUnfree = true;

  # Driver for wifi card
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  boot.initrd.kernelModules = ["wl"];

  # Networking
  networking.hostName = "sanctum";
  networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd"; 
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;

  # Fonts
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [ font-awesome nerdfonts ];
    fontconfig.defaultFonts = {
      monospace = [ "Iosevka Nerd Font Mono" ];
      emoji = [ "Font Awesome Free" ];
    };
  };

  time.timeZone = "Europe/Belgrade";
  environment.systemPackages = with pkgs; [ cage ];

  programs.adb.enable = true;     # adbusers group
  programs.light.enable = true;   # video group
  programs.gphoto2.enable = true; # camera group

  # Sound
  hardware.pulseaudio.enable = true;

  # Bluetooth
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  # hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dimchee = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" "dialout" "adbusers" "camera" ];
  };
  # System variables
  environment.variables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  system.stateVersion = "20.09";
}

