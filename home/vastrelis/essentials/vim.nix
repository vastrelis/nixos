{ config, lib, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    settings = {
      number = true;
      
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      ignorecase = true;
      smartcase = true;
    };
  };
}