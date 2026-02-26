{ config, lib, pkgs, ... }:

let
  configPath = "/etc/nixos/home/vastrelis/niri/dotfiles";
in
{
  programs.alacritty.enable = true;
  programs.firefox.enable = true;

  programs.dank-material-shell = {
    enable = true;
    enableCalendarEvents = false;
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

  home.packages = with pkgs; [
    
  ];

  home.file.".config/DankMaterialShell".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/DankMaterialShell";
  home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/niri";
  home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/alacritty";
}
