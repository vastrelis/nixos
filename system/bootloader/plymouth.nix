{ config, lib, pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      theme = "green_blocks";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "green_blocks" ];
        })
      ];
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
    loader.timeout = 0;
  };
}