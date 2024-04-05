{
  perSystem = {
    pkgs,
    system,
    ...
  }: {
    devshells.default = {
      commands = [
        {
          name = "deploy";
          command = ''
            hostname="$1"

            echo "=> Deploying system $hostname"
            nixos-rebuild switch \
                --verbose \
                --fast \
                --flake .#$hostname \
                --target-host root@$hostname \
                --build-host root@$hostname
          '';
        }
        {
          name = "update";
          command = ''
            echo "=> Updating flake inputs"
            nix flake update

            deploy $1
          '';
        }
      ];
    };
  };
}
