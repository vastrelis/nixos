{ config, lib, pkgs, ... }:

{
  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de_CH-latin1";
  };
  
  services.xserver.xkb.layout = "ch";
}
