{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "vastrelis";
        email = "zero@vastrelis.com";
      };
    };
  };
}