{ config, lib, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../system/bootloader/systemd.nix
        ../../system/countries/switzerland.nix
        ../../system/packages/default.nix
        ../../system/bootloader/plymouth.nix
        ../../system/cpu/intel.nix
        ../../system/gpu/intel-integrated.nix
        ../../system/gpu/nvidia-hybrid.nix
        ../../modules/audio/pipewire.nix
        ../../modules/environment/niri.nix
        ../../modules/fonts/default.nix
        ../../modules/network/firewall.nix
        ../../modules/nix/lsp.nix
        ../../modules/printing/cups.nix
        ../../modules/users/vastrelis.nix
        ../../modules/directories/vault.nix
        ../../modules/nix/permissions.nix
    ];

    networking.hostName = "vstr-laptop-0";

    system.stateVersion = "25.11";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
}

