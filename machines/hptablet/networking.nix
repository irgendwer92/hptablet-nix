{
  config,
  pkgs,
  ...
}: {
  networking = {
    hostName = "hptablet-nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [9993];
  };
  #Zerotier VPN config
  environment.systemPackages = with pkgs; [zerotierone];
  services.zerotierone.enable = true;
  services.zerotierone.joinNetworks = [
    "c9dceb937c246080"
  ];
}
