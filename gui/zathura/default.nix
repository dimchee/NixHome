{ config, pkgs, ... }:
let
  my-zathura = pkgs.symlinkJoin {
    name = "my-zathura";
    paths = [ pkgs.zathura ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/zathura --set XDG_CONFIG_HOME $out/etc
      mkdir -p $out/etc/
      ln -s ${toString ./.}  $out/etc/zathura
    '';
  };
in
{
  environment.systemPackages = with pkgs; [ my-zathura ];
}
