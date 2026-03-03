{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/bootloader/systemd.nix
      ../../system/countries/switzerland.nix
      ../../system/packages/default.nix
      ../../modules/audio/pipewire.nix
      ../../modules/environment/niri.nix
      ../../modules/fonts/default.nix
      ../../modules/network/firewall.nix
      ../../modules/nix/lsp.nix
      ../../modules/printing/cups.nix
      ../../modules/users/vastrelis.nix
      ../../modules/directories/vault.nix
    ];

  networking.hostName = "vstr-desktop-0";

  system.stateVersion = "25.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}

