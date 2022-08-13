{
  pkgs,
  config,
  ...
}: {
  services.udev.packages = with pkgs; [gnome.gnome-settings-daemon]; # needed for appindicator
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome-secrets
    gnome-recipes
    gnome.gnome-screenshot 
  # gnome-shell-extensions
  ];
  # exclude gnome standard packages
  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
    ])
    ++ (with pkgs.gnome; [
      cheese
      gnome-music
      gnome-terminal
      gedit
      epiphany
      geary
      evince
      gnome-characters
      totem
      tali
      iagno
      hitori
      atomix
    ]);
  services.gnome = { 
    chrome-gnome-shell.enable = true;
    gnome-keyring.enable = true;
    gnome-user-share.enable = true; # shared folder over home network
    gnome-settings-daemon.enable = true;
    gnome-remote-desktop.enable = false; # defaults to false, but maybe i'll need it sometime in the future
    gnome-online-accounts.enable = true; # gnome SSO
    tracker.enable = true; # file indexer and search engine
    sushi.enable = true; # nautilus thumb previewer
  };
  services.gnome.rygel.enable = true; # UPnP Mediaserver, needs firewall:
  networking.firewall.allowedUDPPorts = [ 1900 ];
  networking.firewall.extraPackages = [ pkgs.conntrack-tools ];
  networking.firewall.autoLoadConntrackHelpers = true;
  networking.firewall.extraCommands = ''
    nfct add helper ssdp inet udp
    iptables --verbose -I OUTPUT -t raw -p udp --dport 1900 -j CT --helper ssdp
  '';
}
