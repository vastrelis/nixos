{ config, lib, pkgs, vstr-user, ... }:

{
  systemd.tmpfiles.rules = [ 
    "d /vault 0700 ${vstr-user} root - -" 
    "d /vault/personal 0700 ${vstr-user} root - -"
    "d /vault/business 0700 ${vstr-user} root - -"
    "d /vault/projects 0700 ${vstr-user} root - -"

    "a+ /vault - - - - default:user:${vstr-user}:rwx"
    "a+ /vault - - - - default:group:root:rwx"

    "z /vault 0700 ${vstr-user} root - -"
  ];
}