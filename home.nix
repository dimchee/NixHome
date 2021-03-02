{ config, pkgs, ... }:
let
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    ref = "release-20.09";
  };
in
{
  imports = [ (import "${home-manager}/nixos") ];
  home-manager.users.dimchee = {
    programs.home-manager.enable = true;
  };
}
