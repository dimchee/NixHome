# nixos-rebuild switch --flake ~/XDG/Config/NixHome
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    inputs@{ nixpkgs, unstable, ... }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # https://ayats.org/blog/channels-to-flakes
          {
            environment.etc."nix/inputs/nixpkgs".source = nixpkgs.outPath;
            nix.nixPath = [ "nixpkgs=/etc/nix/inputs/nixpkgs" ];
            nix.registry.nixpkgs.flake = nixpkgs;
            nix.registry.unstable.flake = unstable;
          }
          { _module.args.inputs = inputs; }
          ./configuration.nix
        ];
      };
    };
}
