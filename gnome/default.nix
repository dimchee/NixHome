{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    gnomeExtensions.vitals
    gnomeExtensions.blur-my-shell
    gnomeExtensions.screenshot-tool
    gnomeExtensions.adwaita-theme-switcher
    gnomeExtensions.tweaks-in-system-menu
    gnomeExtensions.gsconnect
    gnomeExtensions.duckduckgo-search-provider
    # gnomeExtensions.just-perfection
    # unstable.gnomeExtensions.material-shell
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
}
