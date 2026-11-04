{pkgs, ...}:
{
  environment.variables = rec {
    # XDG default programs
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "wezterm";
    NIXOS = "$HOME/XDG/Config/NixHome";

    # XDG directories
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CACHE_HOME = "$HOME/.cache";

    # Gnome
    XDG_DOWNLOAD_DIR = "$HOME/XDG/Gnome/Downloads";
    XDG_DESKTOP_DIR = "$HOME/XDG/Gnome/Desktop";
    XDG_DOCUMENTS_DIR = "$HOME/XDG/Gnome/Documents";
    XDG_MUSIC_DIR = "$HOME/XDG/Gnome/Music";
    XDG_PICTURES_DIR = "$HOME/XDG/Gnome/Pictures";
    XDG_VIDEOS_DIR = "$HOME/XDG/Gnome/Videos";
    XDG_PUBLIC_DIR = "$HOME/XDG/Gnome/Public";
    XDG_TEMPLATES_DIR = "$HOME/XDG/Gnome/Templates";

    # Program specific
    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    GOPATH = "${XDG_DATA_HOME}/go";
    ELM_HOME = "${XDG_DATA_HOME}/elm";
    JULIA_DEPOT_PATH = "${XDG_DATA_HOME}/julia";
    MATHEMATICA_USERBASE = "${XDG_CONFIG_HOME}/mathematica";
  };
}
