{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
  ];

  options = with lib; {
    storage.rootDisk = {
      device = mkOption {
        type = types.str;
        example = "/dev/disk/by-id/nvme-CT1000P3PSSD8_2226E6424FDD";
      };
    };
  };

  disko.devices.disk.root = {
    type = "disk";
    device = config.storage.rootDisk;
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          type = "EF00";
          size = "500M";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };
        swap = {
          size = "16G";
          content = {
            type = "swap";
            resumeDevice = true; # resume from hiberation from this device
          };
        };
        root = {
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
