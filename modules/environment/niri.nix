{ config, lib, pkgs, vstr-user, ... }:

let 
  session = "${pkgs.niri}/bin/niri-session";
in
{
  programs.niri.enable = true;
 
  services.accounts-daemon.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  systemd.tmpfiles.rules = [
    "d /etc/nixos/home/${vstr-user}/niri/dotfiles 0755 ${vstr-user} root -"
    "Z /etc/nixos/home/${vstr-user}/niri/dotfiles 0755 ${vstr-user} root -"
  ];

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "niri";
  };
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

  # MISC

}
