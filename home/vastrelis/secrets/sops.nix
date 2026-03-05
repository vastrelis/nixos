{ config, lib, pkgs, ... }:

{
  home.sessionVariables = {
    SOPS_AGE_KEY_FILE = "/home/vastrelis/.age.key";
  };

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "/home/vastrelis/.age.key";

    secrets."github_ssh_key" = {
      path = "/home/vastrelis/.ssh/github";
      mode = "0600";
    };
  };

  home.packages = with pkgs; [
    sops
  ];
}
