{ config, pkgs, lib, ... }:
{
  imports = [
    ./julia.nix
    ./python.nix
    ./mathematica.nix
  ];
  environment.variables = {
    GOPATH = "$HOME/Code/Go";
    RUSTC_WRAPPER = "sccache";
  };
  environment.systemPackages = with pkgs; [
    sccache
    swiProlog
    elmPackages.elm
    # elmPackages.elm-test
    # purescript spago
    # dotnet-sdk_3
    # adoptopenjdk-bin
    ghc
    # haskellPackages.hoogle
    # haskellPackages.ghcide
    go
    # nasm
    # lean
    # racket-minimal
    # (agda.withPackages (p: [ p.standard-library ]))
  ];
}
