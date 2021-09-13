{pkgs, config, ...}:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
#    style = ''
#    * {
#      border: none;
#      border-radius: 0;
#      font-family: "Ubuntu Nerd Font";
#      font-size: 13px;
#      min-height: 0;
#      padding: 0 5px;
#    }
#    window#waybar {
#      background-color: rgba(0, 0, 0, 0.8);
#      color: white;
#    }
#    #window {
#      font-weight: bold;
#      font-family: "Ubuntu";
#    }
#    #workspaces button {
#      padding: 0 5px;
#      background: transparent;
#      color: white;
#      border-top: 2px solid transparent;
#    }
#    #workspaces button.focused {
#      color: #c9545d;
#      border-top: 2px solid #c9545d;
#    }
#    #mode {
#      background: #64727D;
#      border-bottom: 3px solid white;
#    }
#    '';
    settings = [{
      layer = "bottom";
      position = "top";
      height = 30;
      modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
      modules-center = [ "sway/window" ];
      modules-right = [ "pulseaudio" "backlight" "network" "cpu" "memory" "battery" "clock" "sway/language" ]; # mpd
      modules."sway/workspaces" = {
        disable-scroll = true;
        all-outputs = false;
        format-icons = {
          focused = "";
          default = "";
        };
      };
    }];
  };
  services.network-manager-applet.enable = true;
  services.redshift = {
    enable = true;
    package = pkgs.redshift-wlr;
    latitude  = 43.320904;
    longitude = 21.895760;
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    package = pkgs.sway;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "bemenu-run --fn 12";
      output."*".bg = "${toString ./suma.png} fill";
      startup = [{
        command = "${pkgs.wl-clipboard}/bin/wl-paste -t text --watch "
                + "${pkgs.clipman}/bin/clipman store";
      }];
      bars = [];
    };
    extraOptions = [ "--debug" ];
    extraConfig = ''
    set $mod ${config.wayland.windowManager.sway.config.modifier}
    
    # Special bindings
    bindsym $mod+Shift+r reload
    bindsym $mod+c exec clipman pick -t wofi
    mode "resize" {
      # Gaps
      bindsym equal+$mod  gaps outer all plus  5px
      bindsym minus+$mod  gaps outer all minus 5px
      bindsym equal+Shift gaps inner all plus  5px
      bindsym minus+Shift gaps inner all minus 5px

      bindsym $mod+bracketLeft mode "default"
    }
    

    for_window {
      [app_id=".*"]        floating enable
      [app_id="firefox"]   floating disable
      [app_id="Alacritty"] floating disable
      [app_id="zathura"]   floating disable
      [title="^🌴⬆🪟"]     floating enable
      [title="app"]     floating enable
      [title="Manekraft"]     floating enable
    }
    input type:keyboard {
	  xkb_layout us,rs,hr
	  xkb_options "grp:alt_shift_toggle"
    }

    # No window title bar
    default_border pixel
    default_floating_border pixel

    # Screenshot
    set $screenshot grim ~/Library/Images/screenshots/scrn-$(date +"%Y-%m-%d-%H-%M-%S").png
    set $screenclip slurp | grim -g - ~/Library/Images/screenshots/scrn-$(date +"%Y-%m-%d-%H-%M-%S").png
    bindsym $mod+Print exec $screenshot
    bindsym $mod+Shift+Print exec $screenclip

    # Special keys
    # bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume @DEFAULT_SINK@ +5%; pkill -SIGRTMIN+2 waybar"
    # bindsym XF86AudioLowerVolume exec "pactl set-sink-volume @DEFAULT_SINK@ -5%; pkill -SIGRTMIN+2 waybar"
    # bindsym XF86AudioMute exec "pactl set-sink-mute @DEFAULT_SINK@ toggle; pkill -SIGRTMIN+2 waybar"
    # bindsym XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
    # bindsym XF86MonBrightnessDown exec brightnessctl set 1%-
    # bindsym XF86MonBrightnessUp exec brightnessctl set +1%
    # bindsym XF86AudioPlay exec mpc toggle
    # bindsym XF86AudioNext exec mpc next
    # bindsym XF86AudioPrev exec mpc prev
    '';
  };
  programs.mako = {
    enable = true;
    backgroundColor = "#63E4FF85";
  };
  home.packages = with pkgs; [
    swaylock
    swayidle
    wl-clipboard clipman
    bemenu # maybe wofi?
    grim slurp # screen capture
  ];

  # sound.mediaKeys.enable = true; # enable sound control
  # environment.variables = {
  #  # For libappindicator
  #  XDG_CURRENT_DESKTOP = "Unity";
  #  # App specific
  #  SDL_VIDEODRIVER = "wayland";
  #  CLUTTER_BACKEND = "wayland";
  #  # Elementary/EFL
  #  ECORE_EVAS_ENGINE = "wayland_egl";
  #  ELM_ENGINE = "wayland_egl";
  #  # Java...
  #  _JAVA_AWT_WM_NONREPARENTING = "1";
  #  # QT apps
  #  QT_QPA_PLATFORM = "wayland-egl";
  #};
}
