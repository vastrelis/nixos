{ config, lib, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    iosevka
    monaspace
  ];
}
