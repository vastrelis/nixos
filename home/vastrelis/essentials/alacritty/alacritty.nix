{ config, lib, pkgs, ... }:

{
    programs.alacritty.enable = true;

    home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/vastrelis/essentials/alacritty/dotfiles";
}