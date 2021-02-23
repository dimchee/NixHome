with import (fetchTarball {
  url = https://github.com/nixos/nixpkgs-channels/archive/e4d710b1c94b81709d8d31479d1cf522385143c0.tar.gz;
  sha256 = "0z5jws7fbyj6ygcm1mpajwvij60h2z9vrwli34gy66iajb350raj";
}) {}; agda.withPackages (p: with p; [ standard-library ])
