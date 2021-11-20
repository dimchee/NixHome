self: super: {
  ccls = super.ccls.overrideAttrs (old: {
    preConfigure = ''
      cmakeFlagsArray+=(-DCMAKE_CXX_FLAGS="-fvisibility=hidden -fno-rtti -std=c++17")
    '';
  });
}
