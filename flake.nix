# nixos-rebuild switch --flake ~/XDG/Config/NixHome
{
	inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
	};
	outputs = inputs@{ nixpkgs, ...} : {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
        # https://ayats.org/blog/channels-to-flakes
        {
          environment.etc."nix/inputs/nixpkgs".source = nixpkgs.outPath;
          nix.nixPath = ["nixpkgs=/etc/nix/inputs/nixpkgs"];
          nix.registry.nixpkgs.flake = nixpkgs;
        }
				{ _module.args.inputs = inputs; }
				./configuration.nix
			];
		};
	};
}
