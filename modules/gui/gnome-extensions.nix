{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.git
    gnomeExtensions.note
    gnomeExtensions.freon 
    gnomeExtensions.worksets
    gnomeExtensions.printers
    gnomeExtensions.shortcuts 
    gnomeExtensions.kill-app
    gnomeExtensions.quake-mode  
    gnomeExtensions.move-panel   
    gnomeExtensions.mmod-panel  
    gnomeExtensions.kube-config   
    gnomeExtensions.all-windows 
    gnomeExtensions.pip-on-top  
    gnomeExtensions.spotify-tray
  #  gnomeExtensions.improved-osk
  ];
}
