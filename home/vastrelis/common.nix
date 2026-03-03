{ config, lib, pkgs, ... }:

{
  imports = [
    ./secrets/sops.nix
    ./development/git.nix
    ./development/direnv.nix
    ./essentials/vim.nix
    ./essentials/shell.nix
    ./essentials/xdg.nix
    ./essentials/ssh.nix
  ];

  home.stateVersion = "25.11";
}
