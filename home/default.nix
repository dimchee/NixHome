{pkgs, config, lib, ...}:
{
  imports = [
    ./desktop.nix ./gui.nix ./vim
  ];
  programs.home-manager = {
    enable = true;
  };
  programs.bash = {
    enable = true;
    shellAliases.home-manager = "home-manager --flake $NIX_HOME";
  };
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "android-studio-stable"
  ];

}
