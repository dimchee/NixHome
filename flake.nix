{
  # inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-20.09";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-21.05";
    neovim.url = "github:nix-community/neovim-nightly-overlay";
    neuron.url = "github:srid/neuron";
    home-manager.url = "github:nix-community/home-manager";  
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      sanctum = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware/sanctum.nix
          ./modules/common.nix
          #home-manager.nixosModules.home-manager
          #{
          #  home-manager.useGlobalPkgs = true;
          #  home-manager.useUserPackages = true;
          #  home-manager.users.dimchee = import ./home;
          #}
        ];
        extraArgs = { inherit inputs; };
      };
      alvearium = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware/alvearium.nix
          ./modules/common.nix
          ./modules/gnome.nix
          ./modules/gaming.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dimchee = import ./home;
          }
        ];
        extraArgs = { inherit inputs; };
      };
    };
  };
}
