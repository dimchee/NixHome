{pkgs, ...}:
let unstable = import <nixos-unstable> {};
in {
  programs.alacritty = {
    enable = true;
    package = unstable.alacritty;
    settings = {
      background_opacity = 0.8;
      font = {
        normal = {
          family = "Iosevka Nerd Font Mono";
          style = "Light";
        };
        #bold = {
        #  family = "monospace";
        #  style = "Normal";
        #};
        #italic = {
        #  family = "monospace";
        #  style = "Light Italic";
        #};
        #bold_italic = {
        #  family = "monospace";
        #  style = "Italic";
        #};
        size = 12;
      };
    };
  };
}
