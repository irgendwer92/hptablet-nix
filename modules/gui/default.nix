{
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./gnome-extensions.nix
    ./gnome-packages.nix
    ./packages.nix
    ./locale-de-keyboard
  ];
#See https://nixos.wiki/wiki/GNOME
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
        defaultSession = "gnome";
        #  defaultSession = "none+bspwm" or "gnome+bspwm";
      layout = "de"; # KeyboardLayout in xserver
      };
      desktopManager.gnome = {
        enable = true;
      };
      windowManager.bspwm.enable = false;
      
    };
  };      
}
