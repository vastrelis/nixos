{ config, lib, pkgs, ... }:

let
  symbols = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "symbols";
      publisher = "miguelsolorio";
      version = "0.0.25";
      sha256 = "sha256-nhymeLPfgGKyg3krHqRYs2iWNINF6IFBtTAp5HcwMs8=";
    };
  };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        mkhl.direnv
        aaron-bond.better-comments
        tamasfe.even-better-toml
        oderwat.indent-rainbow
        yzhang.markdown-all-in-one
        redhat.vscode-yaml
        enkia.tokyo-night
        miguelsolorio.fluent-icons
        symbols
      ];
    };
  };  
}
