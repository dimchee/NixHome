{ config, pkgs, ... }:
{
  imports = [
    ./julia.nix
    #./python.nix
    # ./mathematica.nix
  ];
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
