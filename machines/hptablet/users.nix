{
  config,
  lib,
  ...
}: {
  users.users = {
    richy = {
      initialPassword = "password";
      isNormalUser = true; # isNormalUser can login, isSystemUser can't
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIOdpMmdPMT67FVJCwIyxbKxMAkydtBZJSqUikCd7+67 root@hptablet"
      ];
      extraGroups = ["wheel" "nix-users" "uucp" "lp" "audio" "video" "networkmanager" "scanner"];
    };
  };
}
