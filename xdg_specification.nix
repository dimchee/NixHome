{pkgs, ...}:
{
  environment.variables = rec {
    # XDG default programs
    EDITOR = "nvim";
    BROWSER = "firefox";
    # TERMINAL = "kgx";
    TERMINAL = "alacritty";

    # XDG directories
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
		XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CACHE_HOME = "$HOME/.cache";

    # Program specific
    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    GOPATH = "${XDG_DATA_HOME}/go";
    ELM_HOME="${XDG_DATA_HOME}/elm";
		JULIA_DEPOT_PATH = "${XDG_DATA_HOME}/julia";
    MATHEMATICA_USERBASE = "${XDG_CONFIG_HOME}/mathematica";
  };
}
