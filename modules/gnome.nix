{pkgs, ...}:
{
  nixpkgs.config.firefox.enableGnomeExtensions = true;
  services.gnome.chrome-gnome-shell.enable = true;
  # https://unix.stackexchange.com/questions/437248/how-can-i-install-gnome-shell-extensions-from-extensions-gnome-org-through-firef
  environment.systemPackages = with pkgs; [
    #gnomeExtensions.vitals
    #gnomeExtensions.blur-my-shell
    #gnomeExtensions.screenshot-tool
    #gnomeExtensions.adwaita-theme-switcher
    #gnomeExtensions.tweaks-in-system-menu
    #gnomeExtensions.gsconnect
    #gnomeExtensions.duckduckgo-search-provider
    #gnomeExtensions.no-overview

    # gnomeExtensions.fly-pie
    # gnomeExtensions.kitsch
    # gnomeExtensions.bluetooth-quick-connect
    # gnomeExtensions.just-perfection
    # gnomeExtensions.material-shell
  ];
  environment.gnome.excludePackages = with pkgs; [
    gnome.cheese
    # gnome.gnome-music
    gnome.gnome-terminal
    gnome.gedit
    epiphany
    gnome-tour
  ];
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  services.flatpak.enable = true;
}
