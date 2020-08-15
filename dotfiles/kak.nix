with import <nixpkgs> {};
let
  config = pkgs.writeTextFile (rec {
    name = "kakrc.kak";
    destination = "/share/kak/autoload/${name}";
    text = ''
      eval %sh{kak-lsp --kakoune -s $kak_session}
      lsp-enable
    '';
  });
in
  wrapKakoune kakoune-unwrapped {
    configure = {
      plugins = [ config pkgs.kak-lsp ];
    };
  }
