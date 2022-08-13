{
  pkgs,
  ...
}:{
  environment.systemPackages = with pkgs; [
    epson-escpr2
    epkowa
    utsushi
    arch-install-scripts
    kubectl
    kubectl-tree
    fluxcd
    chromium
    firefox
    thunderbird
    vscode
    fira-code
    tilix
    signal-desktop
    element-desktop
    discord
    prusa-slicer
    super-slicer-latest
    nextcloud-client
    keepassxc
    bitwarden
    betaflight-configurator
    vlc
    spotify
    libreoffice
    teams
    teamspeak_client
    noisetorch
    solaar
    ltunify
    #embytheatre doesn't exist
    #excalidraw doesn't exist
    #pia doesn't exist
    #to add: iscan, iscan-plugin-network, extension-dash-to-dock, theme-mist, extension-sound-output-device-chooser, extension-improvedosk, extension-desktop-icons-ng, gnome-software-packagekit-plugin, gnome-sound-recorder, gnome-system-monitor, nomachine, oh-my-zsh, openscad, rpi-imager, fzf, woff-fira-code, woff2-fira-code, 
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };
  programs.chromium.extensions = [
    "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
  ];
}
