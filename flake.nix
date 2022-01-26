{
  # inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-20.09";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-21.05";
    lean4.url = "github:leanprover/lean4";
    home-manager.url = "github:nix-community/home-manager";  
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rocm.url = "github:nixos-rocm/nixos-rocm";
    rocm.inputs.nixpkgs.follows = "nixpkgs";
    neovim.url = "path:/home/dimchee/Nix/Vim";
    neovim.inputs.nixpkgs.follows = "nixpkgs";
    invicli.url = "path:/home/dimchee/Code/Haskell/Invicli";
    invicli.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager,... }@inputs:
  let
    nix-home = "/home/dimchee/Nix/Sys";
  in {
    nixosConfigurations = {
      sanctum = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          { _module.args.inputs = inputs; }
          { _module.args.nix-home = nix-home; }
          ./hardware/sanctum.nix
          ./modules/common.nix
          #home-manager.nixosModules.home-manager
          #{
          #  home-manager.useGlobalPkgs = true;
          #  home-manager.useUserPackages = true;
          #  home-manager.users.dimchee = import ./home;
          #}
        ];
      };
      alvearium = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          { _module.args.inputs = inputs; }
          { _module.args.nix-home = nix-home; }
          ./hardware/alvearium.nix
          ./modules/common.nix
          ./modules/gnome.nix
          ./modules/gaming.nix
          #home-manager.nixosModules.home-manager
          #{
          #  home-manager.useGlobalPkgs = true;
          #  home-manager.useUserPackages = true;
          #  home-manager.users.dimchee = import ./home;
          #}
        ];
      };
    };
    homeConfigurations = {
      dimchee = home-manager.lib.homeManagerConfiguration {
        username = "dimchee";
        configuration = { ... }: { imports = [ ./home ]; };
        system = "x86_64-linux";
        homeDirectory = "/home/dimchee";
        extraSpecialArgs = { inherit nix-home; inherit inputs; };
      };
    };
  };
}
