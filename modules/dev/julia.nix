{pkgs, ... }:
let
  fixJuliaPkgs = with pkgs; writeScriptBin "fixJuliaPkgs" ''
    #!/usr/bin/env bash
    echo "Taken from https://github.com/mayl/juliaShell"
    PKG_DIR=~/.julia/
    for ARTIFACT in $(find $PKG_DIR/artifacts/*/bin) 
    do
      chmod +w $ARTIFACT
      ${patchelf}/bin/patchelf \
        $ARTIFACT \
        --set-interpreter \
        "$(cat ${stdenv.cc}/nix-support/dynamic-linker)"
      chmod -w $ARTIFACT
    done
    '';
in
{
  environment.systemPackages = with pkgs; [
    fixJuliaPkgs
    julia-stable-bin
  ];
}
