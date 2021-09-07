{ config, pkgs, lib, ... }:
{
  imports = [
    ./julia.nix
    #./python.nix
    # ./mathematica.nix
  ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "mathematica" "android-studio-stable" ];
  environment.variables = {
    GOPATH = "$HOME/Code/Go";
  };
  environment.systemPackages = with pkgs; [
    swiProlog
    elmPackages.elm
    # purescript spago
    # dotnet-sdk_3
    # adoptopenjdk-bin
    ghc
    # haskellPackages.hoogle
    # haskellPackages.ghcide
    go
    # nasm
    lean
    # racket-minimal
    # (agda.withPackages (p: [ p.standard-library ]))
  ];
}
