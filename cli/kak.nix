{ config, pkgs, ... }:
let
  config = pkgs.writeTextFile (rec {
    name = "kakrc.kak";
    destination = "/share/kak/autoload/${name}";
    text = ''
      eval %sh{kak-lsp --kakoune -s $kak_session}
      lsp-enable
    '';
  });
  kak = wrapKakoune kakoune-unwrapped {
    configure = {
      plugins = [ config pkgs.kak-lsp ];
    };
  };
in
{
  environment.systemPackages = [ kak pkgs.kak-lsp ];
}
