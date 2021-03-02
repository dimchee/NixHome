{ pkgs, ... }:
let
# - https://mathematica.stackexchange.com/questions/189306/cant-launch-mathematica-11-on-fedora-29
  mathematica = pkgs.symlinkJoin {
    name = "mathematica_wrapped";
    paths = [ pkgs.mathematica11 ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      rm -r $out/libexec/Mathematica/Executables
      cp -r ${pkgs.mathematica11}/libexec/Mathematica/Executables $out/libexec/Mathematica/
      wrapProgram $out/bin/mathematica --set QT_QPA_PLATFORM xcb
      rm $out/libexec/Mathematica/SystemFiles/Libraries/Linux-x86-64/libfreetype.so
      rm $out/libexec/Mathematica/SystemFiles/Libraries/Linux-x86-64/libfreetype.so.6
      rm $out/libexec/Mathematica/SystemFiles/Libraries/Linux-x86-64/libz.so.1
      echo "REMOVED libfreetype.so libz.so"
      mkdir -p $out/usr/share/Mathematica/Kernel
      echo 'With[{dir = $UserDocumentsDirectory <> "/Wolfram Mathematica"},
        If[DirectoryQ[dir], DeleteDirectory[dir]]
      ]' > $out/usr/share/Mathematica/Kernel/init.m

    '';
  };
in
{
  environment.systemPackages = [ mathematica ];
}
