
{
  config,
  pkgs,
  ...
}: {  
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  #  initrd.kernelModules = [
      # "i2c_hid"
      # "wacom"
      # "usbhid"
      # "i2c_hid_acpi"
      # "mac_hid"
      # "intel_hid"
      # "i2c_designware_core"
      # "i2c_designware_platform"
      # "i2c_i801"
      # "i2c_smbus"
      # "i2c_core"
      # "hid"
      # "usbcore"
      # "xhci_pci"
      # "hid_generic"
      # "psmouse"
      # "regmap_i2c"
      # "i2c_algo_bit"
      # "intel_skl_int3472_tps68470"
      # "intel_vbtn"
  #  ];
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 5;
      systemd-boot = {
        enable = true;
        # limits nixos configuration history
        configurationLimit = 5;
        # make arch dual bootable
        extraEntries = {
          "arch.conf" = ''
            title Arch Linux
            linux /vmlinuz-linux
            initrd /intel-ucode.img
            initrd /initramfs-linux.img
            options root="PARTLABEL=arch" rw
          '';
        };
      };
    };
  };
}
