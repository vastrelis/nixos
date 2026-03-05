{ config, lib, pkgs, ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    
    download = "${config.home.homeDirectory}/Downloads";
    desktop = null;
    documents = null;
    music = null;
    pictures = null;
    publicShare = null;
    templates = null;
    videos = null;
  };
}