{ pkgs, lib, ... }:
{
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [ lutris ];
  boot.kernel.sysctl."abi.vsyscall32" = 0; # need this for LOL
}
