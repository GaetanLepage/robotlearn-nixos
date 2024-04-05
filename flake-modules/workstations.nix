{
  inputs,
  nixpkgs,
  ...
}: {
  flake.nixosConfigurations = let
    hostnames = [
      "chamaeleon"
    ];

    mkHost = hostname:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ../nixos/common
          ../nixos/hosts/${hostname}.nix
        ];
        specialArgs = {
          inherit hostname inputs;
        };
      };
  in
    nixpkgs.lib.genAttrs hostnames mkHost;
}
