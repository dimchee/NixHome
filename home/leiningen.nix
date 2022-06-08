final: prev: {
  leiningen = prev.leiningen.overrideAttrs (old: rec {
    pname = "leiningen";
    version = "2.9.8";
    src = prev.fetchurl {
      url = "https://raw.github.com/technomancy/leiningen/${version}/bin/lein-pkg";
      sha256 = "sha256-mVLLpTnMZFTDtzhevOV1dwh78rkAHDq1xV1mjQrv9uk=";
    };
    jarsrc = prev.fetchurl {
      url = "https://github.com/technomancy/leiningen/releases/download/${version}/${pname}-${version}-standalone.jar";
      sha256 = "sha256-Kg6RFODWI8dIqa3l1ytUEosxtd2xP1GwTFM/EEuwxI0=";
    };
    JARNAME = "${pname}-${version}-standalone.jar";
  });
}
