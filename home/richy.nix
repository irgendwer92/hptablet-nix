# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ 
  inputs, 
  lib, 
  config, 
  pkgs, 
  ...
}: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors), use something like:
    # inputs.nix-colors.homeManagerModule
    ./modules/git.nix
    ./modules/zsh.nix
    # Feel free to split up your configuration and import pieces of it here.
  ];

  # Comment out if you wish to disable unfree packages for your system
  nixpkgs.config.allowUnfree = true;

  # TODO: Set your username
  home = {
    username = "richy";
    homeDirectory = "/home/richy";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  # install a JSON formatted list of all home-manger options at ~/share/doc/home-manager/options.json and can be used for auto-completion etc.
  manual.json.enable = true;
  # install the configuration manual, accessible via "man home-configuration.nix"
  manual.manpages.enable = true;
  
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.05";
}
