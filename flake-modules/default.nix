{
  imports = [
    ./devshell.nix
    ./workstations.nix
  ];

  perSystem = {
    pkgs,
    system,
    ...
  }: {
    formatter = pkgs.alejandra;
  };
}
