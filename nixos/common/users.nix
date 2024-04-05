{
  users = {
    mutableUsers = false;

    users.admin = {
      isNormalUser = true;
      group = "admin";

      # mkpasswd -m sha-256 'secret_passw*rd'
      hashedPassword = "$6$McNrXuOlgljp9o3m$nGaFscg73DyJY8074O2tzmZz1IE3/lGSr9fsj2lvD/cL3pYB.QPvKXw/dy/CB6XR0121xWlw9dfpnEVOkGIP/0";

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEJSonNBBb1DlhaO4EfMh3TbIIsV25phZQ9vp/qKOw9E"
      ];
    };
  };
}
