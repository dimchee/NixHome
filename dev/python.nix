with import <nixpkgs> {};
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
  ]; 
in
  python3.withPackages mypkgs
