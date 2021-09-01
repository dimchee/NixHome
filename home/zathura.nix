{pkgs, ...}:
{
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      default-bg = "rgba(0, 0, 0, 0.8)";
      recolor-lightcolor = "rgba(0, 0, 0, 0)";
      adjust-open = "width";
      selection-clipboard = "clipboard";
      guioptions = ""; # no status bar (toggle with ^n)
    };
  };
}
