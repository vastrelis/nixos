{ config, lib, pkgs, ... }:

let
  configPath = "/etc/nixos/home/vastrelis/niri/dotfiles";
in
{
  programs.alacritty.enable = true;
  programs.firefox.enable = true;
  programs.spotify-player.enable = true;
  programs.spotify-player.package = pkgs.spotify;

  programs.dank-material-shell = {
    enable = true;

    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = false;
    enableClipboardPaste = true;
  };


  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  imports = [
    ../development/codium.nix
    ../development/jetbrains.nix
  ];

  home.packages = with pkgs; [
  ];

  home.file.".config/DankMaterialShell".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/DankMaterialShell";
  home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/niri";
  home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/alacritty";
}
