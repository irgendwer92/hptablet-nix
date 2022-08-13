{
  inputs,
  config,
  pkgs,
  ...
}: {
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
  console = {
    keyMap = "de";
    font = "ter-i22b";
    packages = with pkgs; [terminus_font];
  };
}
