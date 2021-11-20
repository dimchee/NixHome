{ inputs, pkgs, config, ... }:
{
  nix = {
    # readOnlyStore = false;
    package = pkgs.nixFlakes;
    trustedUsers = [ "root" "dimchee" ];
    extraOptions = ''
      experimental-features = nix-command ca-references flakes
      keep-outputs = true
      keep-derivations = true
    '';
    registry = {
      nixpkgs = {
        from = {
          id = "nixpkgs";
          type = "indirect";
        };
        flake = inputs.nixpkgs;
      };
      stable = {
        from = {
          id = "stable";
          type = "indirect";
        };
        flake = inputs.stable;
      };
    };
    binaryCaches = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org/"
      "https://miso-haskell.cachix.org"
      "https://srid.cachix.org"
      "https://mjlbach.cachix.org"
      "https://nixos-rocm.cachix.org"
    ];
    binaryCachePublicKeys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "miso-haskell.cachix.org-1:6N2DooyFlZOHUfJtAx1Q09H0P5XXYzoxxQYiwn6W1e8="
      "srid.cachix.org-1:MTQ6ksbfz3LBMmjyPh0PLmos+1x+CdtJxA/J2W+PQxI="
      "mjlbach.cachix.org-1:dR0V90mvaPbXuYria5mXvnDtFibKYqYc2gtl9MWSkqI="
      "nixos-rocm.cachix.org-1:VEpsf7pRIijjd8csKjFNBGzkBqOmw8H9PRmgAq14LnE="
    ];

    # Set nixpkgs channel to follow flake
    #nixPath = lib.mkForce [ "nixpkgs=/etc/self/nixos/compat" ];
    #registry.nixpkgs.flake = inputs.nixpkgs;
  };
  # Copy system config to allow nixPath to find compat
  #environment.etc.self.source = inputs.self;

  # Add current nixpkgs checkout to /etc/nixpkgs for easy browsing
  #environment.etc.nixpkgs.source = inputs.nixpkgs;
}
