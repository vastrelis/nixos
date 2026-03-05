{ config, lib, pkgs, ... }:

{
  users.users.vastrelis = {
    isNormalUser = true;
    hashedPassword = "$6$xguL9sqcLaNR32f2$XvSx5AblMZYwnwjdTInZ4qz/rhaUDfK514K6uPwszmhFMZNt6EVXLA2tEwTXL7oq1JgXRAvnbs0qF81JegNrP/";
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
  };
  
  security.sudo.enable = true;
}
