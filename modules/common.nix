{ pkgs, nix-home, lib, ... }:
let
in {
  imports = [ ./cli.nix ./dev ./nixpkgs.nix ];
  nixpkgs.config.allowUnfreePredicate = pkg:
  builtins.elem (lib.getName pkg) [
    "steam" "steam-original" "steam-runtime"
    "android-studio-stable" "mathematica"
    "broadcom-sta" # unfree wifi card on laptop :P
  ];


  # Needed for nixos-rebuild and home-manager to work
  environment.variables.NIX_HOME = nix-home;
  programs.bash.shellAliases.nixos-rebuild =
    "nixos-rebuild --flake $NIX_HOME#$HOSTNAME";
  programs.bash.shellAliases.sudo = "sudo ";
  # https://linuxhandbook.com/run-alias-as-sudo/
  # Maybe security.sudo.extraConfig = "Defaults env_keep+=NIX_HOME";

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
      "wheel" "video" "render" "dialout" "adbusers" "networkmanager"
    ];
  };

  environment.systemPackages = with pkgs; [
    firefox alacritty
    cage brave
  ];
  environment.variables = {
    EDITOR = "vim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    PATH = "$PATH:$HOME/Code/scripts";
    XCURSOR_THEME = "Adwaita"; # solves https://github.com/alacritty/alacritty/issues/4780
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

