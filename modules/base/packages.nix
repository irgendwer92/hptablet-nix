{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    jq
    tmate
    tmux
    htop
    vim
    tcpdump
    nmap
    pciutils
    usbutils
    coreutils
    tree
    wget
    htop
    # silly stuff
    sl
    cowsay
  ];
}
