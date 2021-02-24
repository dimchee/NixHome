{ config, pkgs, ... }:
{
  imports = [ ./julia.nix ];
  environment.systemPackages = with pkgs; [
    swiProlog
    mathematica11
    elmPackages.elm
    purescript
    spago
    dotnet-sdk_3
    adoptopenjdk-bin
    # julia
    gnumake
    gnome3.gtk
    gnome3.glade
    ghc
    cabal-install
    haskellPackages.hoogle
    haskellPackages.ghcide
    (import ./agda.nix)
    go
    rustup
    nasm
    lean
    racket-minimal
    (import ./python.nix)
    tectonic
    texlab
    pandoc
    graphviz
  ];
  environment.pathsToLink = [ "/share/agda" ];
}
