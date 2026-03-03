{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    
    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {

        "browser.uiCustomization.state" = builtins.toJSON {
          placements = {
            nav-bar = [
              "back-button" 
              "forward-button" 
              "stop-reload-button"
              "downloads-button"
              "urlbar-container"
              "78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action"
              "ublock0_raymondhill_net-browser-action"
            ];
          };
        };
      };



      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          nicothin-space
          proton-pass
          istilldontcareaboutcookies
        ];
      };
    };
  };
}