{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./dotfiles/sway
    ./dotfiles/mpd.nix
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
  environment.systemPackages = with pkgs; [
    wget
	tree
    file
    ntfs3g
    git
    feh
    mpv
    niv
    lorri
	direnv
    fzf
    lsd
    gotop
    youtube-dl
    mpc_cli
    ncmpcpp
    jq
    tldr
    zip unzip
    ripgrep
    ffmpeg
    imagemagick
    go-pup # html scraper

	alacritty
    firefox-wayland
    discord
    # blender
    # inkscape
    gimp
    libreoffice
	zathura

	# editors
    nodejs
    (import ./dotfiles/vim)
    (import ./dotfiles/kak.nix)
    kak-lsp 
    vscode

    cage

    # devel
	swiProlog
	mathematica11
	elmPackages.elm
    purescript
    spago
	dotnet-sdk_3
	adoptopenjdk-bin
    julia
    gnumake
    gnome3.gtk
	gnome3.glade
    ghc
    cabal-install
    haskellPackages.hoogle
    haskellPackages.ghcide
    (import ./dotfiles/agda.nix)
    go
	rustup
    nasm
    lean
    racket-minimal
    (import ./dotfiles/python.nix)
    tectonic
    texlab
    pandoc
    graphviz
  ];
  environment.pathsToLink = [ "/share/agda" ];

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
    XDG_CONFIG_HOME = "/etc/nixos/dotfiles";
  };


  system.stateVersion = "20.03"; # compatibility DONT TOUCH?
}

