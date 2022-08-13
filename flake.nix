
{
  description = "hptablet";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  #  inputs.mobile-nixos.url = github:NixOS/mobile-nixos;
  #  inputs.mobile-nixos.flake = false;
  };

  outputs = { 
    nixpkgs, 
    home-manager, 
    ... 
    }@inputs: {
    nixosConfigurations = {
      hptablet = nixpkgs.lib.nixosSystem {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ 
          ./machines/hptablet 
          ];
        # Pass inputs down to our config, so that they can consume flake inputs
        specialArgs = { inherit inputs; };
      };
    };
    homeConfigurations = {
      "richy@hptablet" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ 
          ./home/richy.nix 
          ];
        # Pass inputs down to our config, so that they can consume flake inputs
        extraSpecialArgs = { inherit inputs; };
      };
    };
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    # `nix run .#nixos-rebuild -- switch --flake .#vrosh-tablet-01 --target-host root@192.168.36.237`
    # to build and deploy from a non-nixos machine
    apps.x86_64-linux.nixos-rebuild = {
      type = "app";
      program = "${nixpkgs.legacyPackages.x86_64-linux.nixos-rebuild}/bin/nixos-rebuild";
    };
    apps.x86_64-linux.nixos-enter = {
      type = "app";
      program = "${nixpkgs.legacyPackages.x86_64-linux.nixos-install-tools}/bin/nixos-enter";
    };
    # `nix run .#nixos-install -- <commands for nixos-install>`
    # don't remove the double dash!
    # i played around with nixos-install to directly install nixos on the ssd from my dev machine
    apps.x86_64-linux.nixos-install = {
      type = "app";
      program = "${nixpkgs.legacyPackages.x86_64-linux.nixos-install-tools}/bin/nixos-install";
  };
}
