{ config, pkgs, lib, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraOptions = [ "--debug" "-c" "/home/dimchee/NixHome/desk/sway/config" ];
    extraPackages = with pkgs; [
      swaylock-fancy # lockscreen
      xwayland       # for legacy apps
      waybar         # status bar
      mako libnotify # notification daemon
      kanshi         # autorandr
      bemenu         # 
      grim           # screenshot
      slurp          # screenshot
      wf-recorder    # record screen (video)
      brightnessctl  # light
      wl-clipboard   # clipboard
      clipman
      qt5.qtwayland  # qt support
      libappindicator# for tray in waybar
      (pkgs.writeTextFile {
          name = "startway";
          destination = "/bin/startway";
          executable = true;
          text = ''
            #! ${pkgs.bash}/bin/bash
            # systemctl --user import-environment
            # systemctl --user start way-session.target
            ${pkgs.sway}/bin/sway
          '';
        })
    ];
  };
  # nixpkgs.config.pulseaudio = true; # waybar pulseaudio support
  environment.etc = {
    "sway/config".source = ./config;
    "xdg/waybar/config".source = ../waybar/config;
    "xdg/waybar/style.css".source = ../waybar/style.css;
  };
  # sound.mediaKeys.enable = true; # enable sound control
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

  location = {
    latitude  = 43.320904;
    longitude = 21.895760;
  };
  services.redshift = {
    enable = true;
    package = pkgs.redshift-wlr;
  };
}
#  systemd.user.targets.way-session = {
#    description = "Wayland compositor session";
#    documentation = [ "man:systemd.special(7)" ];
#    bindsTo = [ "graphical-session.target" ];
#    wants = [ "graphical-session-pre.target" ];
#    after = [ "graphical-session-pre.target" ];
#  };
#  systemd.user.services.sway = {
#    description = "Sway - Wayland window manager";
#    bindsTo = [ "way-session.target" ];
#    wants = [ "way-session.target" ];
#    after = [ "way-session.target" ];
#    environment.PATH = lib.mkForce null;
#    serviceConfig = {
#      ExecStart = "${pkgs.sway}/bin/sway";
#      RestartSec = 1;
#      Restart = "on-failure";
#      TimeoutStopSec = 10;
#    };
#  };
#  systemd.user.services.kanshi = {
#    description = "Kanshi output autoconfig ";
#    wantedBy = [ "way-session.target" ];
#    partOf =  [ "way-session.target" ];
#    serviceConfig = {
#      # config at .config/kanshi/config
#      ExecStart = "${pkgs.kanshi}/bin/kanshi";
#      RestartSec = 5;
#      Restart = "always";
#    };
#  };
#}
