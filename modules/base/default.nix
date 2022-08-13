# base settings for every machine
{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./ssh.nix
    ./locale-de-keyboard.nix
    ./packages.nix
  ];


  nix = {
    # This will add your inputs as registries, making operations with them (such
    # as nix shell nixpkgs#name) consistent with your flake inputs.
    registry = lib.mapAttrs' (n: v: lib.nameValuePair n {flake = v;}) inputs;
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings.auto-optimise-store = true;
  };
  nixpkgs.config.allowUnfree = true;
}
