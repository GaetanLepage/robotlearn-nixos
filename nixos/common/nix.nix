{
  nixpkgs.config.allowUnfree = true;

  # Enable flake support
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes

      warn-dirty = false
    '';

    # Garbage collection
    gc = {
      automatic = true;
      dates = "05:00";
      options = "--delete-older-than 4d";
    };
  };
}
