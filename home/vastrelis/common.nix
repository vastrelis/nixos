{ config, lib, pkgs, awww, ... }:

{
  programs.fastfetch.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "vastrelis";
        email = "zero@vastrelis.com";
      };
    };
  };

  programs.vim = {
    enable = true;
    settings = {
      number = true;
      
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      ignorecase = true;
      smartcase = true;

      undofile = true;
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    
    download = "${config.home.homeDirectory}/Downloads";

    extraConfig = {
      "PROJECTS"  = "${config.home.homeDirectory}/Projects";
      "BUSINESS"  = "${config.home.homeDirectory}/Business";
      "PERSONAL"  = "${config.home.homeDirectory}/Personal";
    };

    desktop = null;
    documents = null;
    music = "${config.home.homeDirectory}/Music";
    pictures = null;
    publicShare = null;
    templates = null;
    videos = null;
  };


  imports = [
    ./niri/settings.nix
    #./secrets/sops.nix
  ];

  home.packages = [
  ];

  home.stateVersion = "25.11";
}
