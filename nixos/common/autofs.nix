{pkgs, ...}: {
  services.autofs = {
    enable = true;

    autoMaster = let
      mkConfig = name:
        pkgs.writeText "auto.${name}" ''
          * -soft,bg &:/local_${name}
        '';
    in ''
      /scratch ${mkConfig "scratch"} --timeout=60
      /scratch2 ${mkConfig "scratch2"} --timeout=60
    '';
  };
}
