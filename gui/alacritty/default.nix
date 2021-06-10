{ stdenv
, lib
, fetchFromGitHub
, rustPlatform

, cmake
, gzip
, installShellFiles
, makeWrapper
, ncurses
, pkg-config
, python3

, expat
, fontconfig
, freetype
, libGL
, libX11
, libXcursor
, libXi
, libXrandr
, libXxf86vm
, libxcb
, libxkbcommon
, wayland
, xdg-utils

  # Darwin Frameworks
, AppKit
, CoreGraphics
, CoreServices
, CoreText
, Foundation
, OpenGL
}:
let
  rpathLibs = [
    expat
    fontconfig
    freetype
    libGL
    libX11
    libXcursor
    libXi
    libXrandr
    libXxf86vm
    libxcb
  ] ++ lib.optionals stdenv.isLinux [
    libxkbcommon
    wayland
  ];
in
rustPlatform.buildRustPackage rec {
  pname = "alacritty-beata";
  version = "0.7.2";

  src = fetchFromGitHub {
    owner = "ayosec";
    repo = "alacritty";
    rev = "0b872b11d74762f24c7fd0ec7ca5c8519c469910";
    sha256 = "1qgl0h9hnrxgsbjv8krc4nj9b5rc2vlzrdbf5drqdy4zsskirhig";
    fetchSubmodules = true;
  };

  cargoSha256 = "sha256-PWnNTMNZKxsfS1OAXe4G3zjfg5gK1SMTc0JJrW90iSM=";

  nativeBuildInputs = [
    cmake
    gzip
    installShellFiles
    makeWrapper
    ncurses
    pkg-config
    python3
  ];

  buildInputs = rpathLibs
    ++ lib.optionals stdenv.isDarwin [
    AppKit
    CoreGraphics
    CoreServices
    CoreText
    Foundation
    OpenGL
  ];

  outputs = [ "out" "terminfo" ];

  postPatch = ''
    substituteInPlace alacritty/src/config/mouse.rs \
      --replace xdg-open ${xdg-utils}/bin/xdg-open
  '';

  postInstall = (
    if stdenv.isDarwin then ''
      mkdir $out/Applications
      cp -r extra/osx/Alacritty.app $out/Applications
      ln -s $out/bin $out/Applications/Alacritty.app/Contents/MacOS
    '' else ''
      install -D extra/linux/Alacritty.desktop -t $out/share/applications/
      install -D extra/logo/compat/alacritty-term.svg $out/share/icons/hicolor/scalable/apps/Alacritty.svg

      # patchelf generates an ELF that binutils' "strip" doesn't like:
      #    strip: not enough room for program headers, try linking with -N
      # As a workaround, strip manually before running patchelf.
      strip -S $out/bin/alacritty

      patchelf --set-rpath "${lib.makeLibraryPath rpathLibs}" $out/bin/alacritty
    ''
  ) + ''

    installShellCompletion --zsh extra/completions/_alacritty
    installShellCompletion --bash extra/completions/alacritty.bash
    installShellCompletion --fish extra/completions/alacritty.fish

    install -dm 755 "$out/share/man/man1"
    gzip -c extra/alacritty.man > "$out/share/man/man1/alacritty.1.gz"

    install -Dm 644 alacritty.yml $out/share/doc/alacritty.yml

    install -dm 755 "$terminfo/share/terminfo/a/"
    tic -xe alacritty,alacritty-direct -o "$terminfo/share/terminfo" extra/alacritty.info
    mkdir -p $out/nix-support
    echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
  '';

  dontPatchELF = true;

  meta = with lib; {
    description = "A cross-platform, GPU-accelerated terminal emulator";
    homepage = "https://github.com/alacritty/alacritty";
    license = licenses.asl20;
    maintainers = with maintainers; [ Br1ght0ne mic92 cole-h ma27 ];
    platforms = platforms.unix;
  };
}
