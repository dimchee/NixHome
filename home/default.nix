{pkgs, lib, inputs, ...}:
{
  imports = [
    ./desktop.nix ./gui.nix ./vim
  ];
  home.packages = with pkgs; [
    # inputs.lean4.packages.x86_64-linux
    arduino-cli
    discord
    fondo
    gcc
    godot
    julia-stable-bin
    koka
    libnotify
    lutris
    pinta
    pplatex
    python
    shortwave
    sqlitebrowser
    teams
    gnome.totem
    wasm3
    wofi
    xorg.xeyes
    #(juniper.overrideAttrs (old : {
    #  version = "3.0.0";
    #  src = fetchzip {
    #    url = "http://www.juniper-lang.org/installers/Juniper-3.0.0.zip";
    #      # sha256 = "10am6fribyl7742yk6ag0da4rld924jphxja30gynzqysly8j0va";
    #      # sha256 = "09srw3dk2bxa49ikjpmgdswd576h10p4kvq9kcr7l9smfdd1kw4j";
    #      sha256 = "1nla00f3422bgwqp7dwij38ar61z6dk81s8ac1dwxmn74yb93zfv";
    #      stripRoot = false;
    #    };
    #    installPhase = ''
    #    runHook preInstall
    #    mkdir -p $out/bin
    #    cp -r ./* $out
    #    chmod +x $out/Juniper
    #    makeWrapper $out/Juniper $out/bin/juniper
    #    runHook postInstall
    #    '';
    #  })
    #)
    (import ./juniper.nix pkgs)
  ];
  programs.home-manager = {
    enable = true;
  };
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # when not working run: nix-shell '<home-manager>' -A install
  programs.bash = {
    enable = true;
    shellAliases.home-manager = "home-manager --flake $NIX_HOME";
    bashrcExtra = "[ -f .bash_completion ] && source .bash_completion"; # for arduino-cli
  };
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "android-studio-stable"
    "teams" "discord"
    "steam" "steam-original" "steam-runtime"
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "libgit2-0.27.10"
  ];

}
