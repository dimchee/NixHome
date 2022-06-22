{ inputs, pkgs, config, ... }:
{
  nix = {
    # readOnlyStore = false;
    trustedUsers = [ "root" "dimchee" ];
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
      "unstable=${inputs.unstable}"
      "nixos-config=$NIX_HOME/configuration.nix"
    ];
    registry = {
      nixpkgs.flake = inputs.nixpkgs;
      unstable.flake = inputs.unstable;
    };

    settings = {
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org/"
        "https://miso-haskell.cachix.org"
        "https://srid.cachix.org"
        "https://mjlbach.cachix.org"
        "https://nixos-rocm.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "miso-haskell.cachix.org-1:6N2DooyFlZOHUfJtAx1Q09H0P5XXYzoxxQYiwn6W1e8="
        "srid.cachix.org-1:MTQ6ksbfz3LBMmjyPh0PLmos+1x+CdtJxA/J2W+PQxI="
        "mjlbach.cachix.org-1:dR0V90mvaPbXuYria5mXvnDtFibKYqYc2gtl9MWSkqI="
        "nixos-rocm.cachix.org-1:VEpsf7pRIijjd8csKjFNBGzkBqOmw8H9PRmgAq14LnE="
      ];
      auto-optimise-store = true;
    };
  };

  # Add current nixpkgs checkout to /etc/nixpkgs for easy browsing
  environment.etc.nixpkgs.source = inputs.nixpkgs;
}
