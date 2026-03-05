{ config, lib, pkgs, ... }:

{
  programs.dank-material-shell = {
    enable = true;

    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = false;
    enableClipboardPaste = true;
  };
  
  home.file.".config/DankMaterialShell".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/vastrelis/niri/dotfiles/DankMaterialShell";
}