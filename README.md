# TODO:

- Gnome-Extensions
- Configure Home-Manager and port the Chezmoi-Config
- Nix User Repository
  - Firefox-Addons
- Understand Overlays

# Useful commands

- nix flake check
- nix flake lock (--recreate-lock-file)
- nix fmt
- nix-garbage-collect (-d)


# The Nixos-Tools given in the flake.nix

- nix run .#nixos-install -- --flake .#hptablet
- nix run .#nixos-rebuild -- --flake .#hptablet
- nix run .#nixos-enter -- --flake .#hptablet (something like chroot)

# Mounting the encrypted drive

- sudo cryptsetup open /dev/nvme0n1p5 cryptroot
- sudo mount /dev/mapper/cryptroot /mnt
- Don't forget to mount the boot drive

# The flake and its logic

- This should get to be an universal flake, so i made it highly modular:


## The flake.nix 

- The flake.nix is minimal, most of it consists of the references to the machine-configs and the nixos-tools you can then run on non-nixos-machines.


## The machines

- The machines-folder consists of the machine-specific settings which also import the different modules. 


## The modules

The modules are for installing and configuring sets of packages needed for different types of machines:

- The base module consists of the packages and config that should stay the same across all machines - even the headless, virtual or arm-based ones.

- The ifDesktop module is for Laptops and Desktop machines. 
