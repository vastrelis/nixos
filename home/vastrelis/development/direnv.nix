{ config, lib, pkgs, ... }: 

{
    programs.direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
        silent = true;
    };
}
