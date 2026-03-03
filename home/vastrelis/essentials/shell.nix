{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    
    initExtra = ''
      vstr-dev-init() {
        nix flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#''${1:-define}"
        direnv allow
      }
    '';
  };
  programs.fastfetch.enable = true;

  home.shellAliases = {
    vpl = "cd /vault/personal";
    vbs = "cd /vault/business";
    vps = "cd /vault/projects";
  };
}