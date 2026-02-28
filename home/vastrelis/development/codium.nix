{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        miguelsolorio.fluent-icons
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
      ];
    };
  };
}
