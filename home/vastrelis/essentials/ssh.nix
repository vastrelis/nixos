{ config, lib, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "/home/vastrelis/.ssh/github";
      };
    };
  };
}