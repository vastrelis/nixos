{ config, lib, pkgs, awww, ... }:

{
  programs.fastfetch.enable = true;
  
  programs.git = {
    enable = true;
    userName = "vastrelis";
    userEmail = "zero@vastrelis.com";
    
  };


  imports = [
    ./niri/settings.nix
    ./secrets/sops.nix
  ];

  home.packages = [
  ];

  home.stateVersion = "25.11";
}
