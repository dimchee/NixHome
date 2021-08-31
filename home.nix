{pkgs, config, ...}:
{
  imports = [
    ./desktop
  ];
  programs.home-manager = {
    enable = true;
  };
  programs.bash = {
    enable = true;
    shellAliases.home-manager = "home-manager -f ~/NixHome/home.nix";
  };

}
