{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./xdg_specification.nix
    ];
	nixpkgs.overlays =
		[ inputs.neovim.overlay
      # (self: super: {
      #   flatpak = super.flatpak.overrideAttrs (oldAttrs : rec {
      #     version = "1.15.2";
      #     src = super.fetchurl {
      #       url = "https://github.com/flatpak/flatpak/releases/download/${version}/flatpak-${version}.tar.xz";
      #       sha256 = "sha256-KS44PY0bwdH9/QMfOAKwVQ2QvE/TALPk/ZwssHUKjWM=";
      #     };
      #   });
      # })
		];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.plymouth.enable = true;
	nix.settings.trusted-users = [ "root" "dimchee" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # GSconnect
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];

  # Set your time zone.
  time.timeZone = "Europe/Belgrade";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # SSD maintainance once a week
  services.fstrim.enable = true;

  # Enable X11, GNOME, and keymaps
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };
  services.flatpak.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  nix.extraOptions = "experimental-features = nix-command flakes";
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dimchee = {
    isNormalUser = true;
    description = "Dimchee";
    extraGroups = [ "networkmanager" "wheel" "adbusers" "docker" ];
    packages = with pkgs; [
			cachix
			direnv
			imv
      pkgs.gnomeExtensions.gsconnect
			#julia-bin
			# elm elm-live elm-test
    ];
  };

  virtualisation.docker.enable = true;

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "dimchee";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  # systemd.services."getty@tty1".enable = false;
  # systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
    neovim git
		alacritty
		firefox chromium
    ffmpeg vlc
  ];
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

  programs.adb.enable = true;
  system.stateVersion = "22.05"; # Did you read the comment?

}

