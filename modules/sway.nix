{pkgs, ...}:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      mako
      alacritty
      dmenu

      gtk-engine-murrine
      gtk_engines
      gsettings-desktop-schemas
      lxappearance
    ];
  };
  environment.variables = {
    XDG_CURRENT_DESKTOP = "Unity"; # For libappindicator
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    ECORE_EVAS_ENGINE = "wayland_egl"; # Elementary/EFL
    ELM_ENGINE = "wayland_egl";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_QPA_PLATFORM = "wayland-egl";
  };
  location = {
    latitude  = 43.320904;
    longitude = 21.895760;
  };
  services.redshift = {
    enable = true;
    package = pkgs.gammastep;
  };
}
