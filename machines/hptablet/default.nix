{ 
  inputs, 
  lib, 
  config, 
  pkgs, 
  ... 
}: {

  imports = [
    ./hardware-configuration.nix
    ./networking.nix
    ./boot.nix
    ./users.nix
    ../../modules/base
    ../../modules/gui
  #  (import "${inputs.mobile-nixos}/lib/configuration.nix" {})
  #  ../../modules/mobile-nixos-stage-1
  ];
  # This activates home-manager profiles for each user upon login
  # This is useful when using ephemeral installations
  environment.loginShellInit = ''
    [ -d "$HOME/.nix-profile" ] || /nix/var/nix/profiles/per-user/$USER/home-manager/activate &> /dev/null
  '';
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.05";
}
