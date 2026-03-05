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

    home.file.".config/VSCodium/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/vastrelis/development/codium/dotfiles/settings.json";
    home.file.".config/VSCodium/User/keybindings.json".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/vastrelis/development/codium/dotfiles/keybindings.json";
    home.file.".config/VSCodium/User/snippets/".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/vastrelis/development/codium/dotfiles/snippets/";
}
