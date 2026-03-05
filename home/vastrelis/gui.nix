{ config, lib, pkgs, ... }:

{
  imports = [
    ./development/direnv.nix
    ./development/codium/codium.nix
  
    ./essentials/firefox.nix
    ./essentials/alacritty/alacritty.nix
    ./essentials/misc.nix
  ];
}