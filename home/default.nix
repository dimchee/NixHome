{pkgs, lib, inputs, ...}:
{
  imports = [
    ./desktop.nix ./gui.nix ./vim
  ];
  home.packages = [
    # inputs.lean4.packages.x86_64-linux
  ];
  programs.home-manager = {
    enable = true;
  };
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.direnv.nix-direnv.enableFlakes = true;

  programs.bash = {
    enable = true;
    shellAliases.home-manager = "home-manager --flake $NIX_HOME";
  };
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "android-studio-stable"
  ];

}
