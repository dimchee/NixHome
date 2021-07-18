{
  # inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-20.09";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.neovim.url = "github:nix-community/neovim-nightly-overlay";
  inputs.neuron.url = "github:srid/neuron";

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.sanctum = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./cachix.nix
      ];
      extraArgs = { inputs=inputs; };
    };
    # Exported to allow using flake checkout as channel
    legacyPackages.x86_64-linux =
      (builtins.head (builtins.attrValues self.nixosConfigurations)).pkgs;
  };
}
