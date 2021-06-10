{ pkgs, ... }:
let
  emacs = with pkgs; (emacsPackagesGen emacs-nox).emacsWithPackages (
    epkgs: (with epkgs.melpaStablePackages; [
      magit
      zerodark-theme
    ])
  );
in
{
  environment.systemPackages = [ emacs ];
}
