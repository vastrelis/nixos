{ config, lib, pkgs, vstr-user, ... }:

{
  systemd.tmpfiles.rules = [
    "d /etc/nixos/ 0755 ${vstr-user} root -"
    "Z /etc/nixos/ 0755 ${vstr-user} root -"
  ];
}