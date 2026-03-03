{ config, lib, pkgs, ... }:

{
  imports = [
    ./development/direnv.nix
    ./development/vscodium.nix
  
    ./essentials/firefox.nix
    ./essentials/alacritty/alacritty.nix
  ];
}