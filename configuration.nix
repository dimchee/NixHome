{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./cachix.nix
    # ./home.nix
    ./desk ./cli ./dev ./gui
  ];
  
  nix = {
    package = pkgs.nixFlakes;
    trustedUsers = [ "root" "dimchee" ];
    extraOptions = ''
      experimental-features = nix-command ca-references flakes
      keep-outputs = true
    '';
    # Set nixpkgs channel to follow flake
    nixPath = lib.mkForce [ "nixpkgs=/etc/self/nixos/compat" ];
    registry.nixpkgs.flake = inputs.nixpkgs;
  };
  # Copy system config to allow nixPath to find compat
  environment.etc.self.source = inputs.self;

  # Add current nixpkgs checkout to /etc/nixpkgs for easy browsing
  environment.etc.nixpkgs.source = inputs.nixpkgs;
  
  # Enable Unfree software
  nixpkgs.config.allowUnfree = true;

  
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
  powerManagement = {
    enable = true;
    powertop.enable = true;
    scsiLinkPolicy = "med_power_with_dipm";
  };

  # Driver for wifi card (unfree :P)
  boot.extraModulePackages = with config.boot.kernelPackages; [
    broadcom_sta v4l2loopback
  ];
  boot.initrd.kernelModules = ["wl"];

  # Networking
  networking.hostName = "sanctum";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.scanRandMacAddress = false; # for wifi to work
  #networking.networkmanager.wifi.backend = "iwd"; 
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true;
  networking.firewall.allowedTCPPorts = [ 80 8888 ];

  # Fonts
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [ font-awesome nerdfonts ubuntu_font_family ];
    fontconfig.defaultFonts = {
      sansSerif = [ "Ubuntu" ];
      monospace = [ "Iosevka Nerd Font Mono" ];
      emoji = [ "Font Awesome Free" ];
    };
  };

  time.timeZone = "Europe/Belgrade";
  environment.systemPackages = with pkgs; [ cage cachix ];

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
     extraGroups = [ "wheel" "video" "dialout" "adbusers" "networkmanager" ];
  };
  # System variables
  environment.variables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };
  environment.extraInit = "export PATH=$PATH:$HOME/Code/scripts";

  system.stateVersion = "21.05";
}

