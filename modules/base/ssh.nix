{
  inputs,
  config,
  pkgs,
  ...
}: {
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    permitRootLogin = "without-password";
  };
}
