{ pkgs, ... }:
let
  mypkgs = pypkgs: with pypkgs; [
    pandas
    requests
    sympy
    matplotlib
    jupyter
    ipython
    qtconsole
    beautifulsoup4
    #pyls-mypy
  ]; 
in
{
  environment.systemPackages = with pkgs; [
    (python3.withPackages mypkgs)
  ];
}
