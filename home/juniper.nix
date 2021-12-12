{ lib, stdenv, fetchzip, autoPatchelfHook, makeWrapper, krb5, lttng-ust, zlib, ... }:

stdenv.mkDerivation rec {
  pname = "juniper";
  version = "3.0.0";

  src = fetchzip {
    url = "http://www.juniper-lang.org/installers/Juniper-${version}.zip";
    #sha256 = "10am6fribyl7742yk6ag0da4rld924jphxja30gynzqysly8j0vg";
    sha256 = "1nla00f3422bgwqp7dwij38ar61z6dk81s8ac1dwxmn74yb93zfv";
    stripRoot = false;
  };

  doCheck = true;

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
    stdenv.cc.cc.lib
    krb5
    lttng-ust
    zlib
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp -r ./* $out
    cp ${lttng-ust}/lib/liblttng-ust.so $out/liblttng-ust.so.0
    chmod +x $out/Juniper
    ln -s $out/Juniper $out/bin/juniper
    wrapProgram $out/Juniper --set DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 1
    runHook postInstall
  '';

  meta = with lib; {
    description = "Functional reactive programming language for programming Arduino";
    longDescription = ''
      Juniper targets Arduino and supports many features typical of functional programming languages, including algebraic data types, tuples, records,
      pattern matching, immutable data structures, parametric polymorphic functions, and anonymous functions (lambdas).
      Some imperative programming concepts are also present in Juniper, such as for, while and do while loops, the ability to mark variables as mutable, and mutable references.
    '';
    homepage = "https://www.juniper-lang.org/";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
