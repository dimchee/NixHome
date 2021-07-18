{ config, pkgs, ... }:
{
  imports = [
    ./julia.nix ./python.nix
    # ./mathematica.nix
  ];
  environment.systemPackages = with pkgs; [
    swiProlog
    elmPackages.elm
    purescript
    spago
    dotnet-sdk_3
    adoptopenjdk-bin
    gnumake
    gnome3.gtk
    gnome3.glade
    ghc
    cabal-install
    haskellPackages.hoogle
    haskellPackages.ghcide
    go
    rustup
    nasm
    lean
    racket-minimal
    tectonic
    texlab
    pandoc
    graphviz
    (agda.withPackages (p: [ p.standard-library ]))
  ];
}
