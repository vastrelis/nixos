{ config, lib, pkgs, vstr-user, ... }:

let 
  session = "${pkgs.niri}/bin/niri";
in
{
  programs.niri.enable = true;
 
  environment.systemPackages = with pkgs; [
  ];
 
  services.accounts-daemon.enable = true;
  services.power-profiles-daemon.enable = true;

  systemd.tmpfiles.rules = [
    "d /etc/nixos/home/${vstr-user}/niri/dotfiles 0755 ${vstr-user} root -"
  ];

  services.xserver.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${session}";
        user = "${vstr-user}";
      };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --asterisks --remember --remember-user-session --time --cmd ${session}";
        user = "greeter";
      };
    };
  };
}
