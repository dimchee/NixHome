{ config, pkgs, lib, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraOptions = [];
    extraPackages = with pkgs; [
      swaylock-fancy # lockscreen
      swayidle       #
      xwayland       # for legacy apps
      waybar         # status bar
      mako libnotify # notification daemon
      kanshi         # autorandr
      bemenu         # 
      grim           # screenshot
      slurp          # screenshot
      brightnessctl  # light
    ];
  };
  environment.variables = {
    # For libappindicator
    XDG_CURRENT_DESKTOP = "Unity";
    # App specific
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    # Elementary/EFL
    ECORE_EVAS_ENGINE = "wayland_egl";
    ELM_ENGINE = "wayland_egl";
    # Java...
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
  environment.etc = {
    "sway/config".source = ./config;
    "xdg/waybar/config".source = ../waybar/config;
    "xdg/waybar/style.css".source = ../waybar/style.css;
  };

  # Here we but a shell script into path, which lets us start sway.service (after importing the environment of the login shell).
  environment.systemPackages = with pkgs; [
    (
      pkgs.writeTextFile {
        name = "startway";
        destination = "/bin/startway";
        executable = true;
        text = ''
          #! ${pkgs.bash}/bin/bash
          # first import environment variables from the login manager
          systemctl --user import-environment
          # then start the service
          systemctl --user start way-session.target
        '';
      }
    )
    qt5.qtwayland # has to be here
    libappindicator# for tray in waybar
  ];
  systemd.user.targets.way-session = {
    description = "Wayland compositor session";
    documentation = [ "man:systemd.special(7)" ];
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
  };
  systemd.user.services.sway = {
    description = "Sway - Wayland window manager";
    documentation = [ "man:sway(5)" ];
    wantedBy = [ "way-session.target" ];
    partOf = [ "way-session.target" ];
    # We explicitly unset PATH here
    environment.PATH = lib.mkForce null;
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.sway}/bin/sway --debug ";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  location = {
    latitude  = 43.320904;
    longitude = 21.895760;
  };
  services.redshift = {
    enable = true;
    package = pkgs.redshift-wlr;
  };
  systemd.user.services.kanshi = {
    description = "Kanshi output autoconfig ";
    wantedBy = [ "way-session.target" ];
    partOf =  [ "way-session.target" ];
    serviceConfig = {
      # config at .config/kanshi/config
      ExecStart = "${pkgs.kanshi}/bin/kanshi";
      RestartSec = 5;
      Restart = "always";
    };
  };
  # mako is starting automaticaly (see github)
  systemd.user.services.idle = {
    description = "Sway idle";
    wantedBy = [ "way-session.target" ];
    partOf = [ "way-session.target" ];
    after = [ "sway.service" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = ''
        ${pkgs.swayidle}/bin/swayidle -w \
          timeout 5    \' ${pkgs.swaylock-fancy}/bin/swaylock-fancy -f -c 000000 \' \
          timeout 10   \' ${pkgs.sway}/bin/swaymsg \" output * dpms off \" \' \
          resume       \' ${pkgs.sway}/bin/swaymsg \" output * dpms on  \" \' \
          before-sleep \' ${pkgs.swaylock-fancy}/bin/swaylock-fancy -f -c 000000 \'
      '';
      RestartSec = 1;
      Restart = "on-failure";
    };
  };
}
