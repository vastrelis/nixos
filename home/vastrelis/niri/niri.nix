{ config, lib, pkgs, ... }:

{

  imports = [
    ../gui.nix
    ./dms.nix
    ./misc.nix
  ];

  home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/vastrelis/niri/dotfiles/niri";
}
