{pkgs, ...}:
{
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      background_opacity = 0.8;
      window.decorations = "none";
      font = {
        normal = {
          family = "Iosevka";
          style = "Light";
        };
        bold = {
          family = "Iosevka";
          style = "Bold";
        };
        italic = {
          family = "Iosevka";
          style = "Light Italic";
        };
        bold_italic = {
          family = "Iosevka";
          style = "Italic";
        };
        size = 12;
      };
    };
  };
}
