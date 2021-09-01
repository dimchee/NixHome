{pkgs, config, ...}:
{
  imports = [
    ./desktop.nix ./gui.nix
  ];
  programs.home-manager = {
    enable = true;
  };
  programs.bash = {
    enable = true;
    shellAliases.home-manager = "home-manager -f ~/NixHome/home/default.nix";
  };

}
