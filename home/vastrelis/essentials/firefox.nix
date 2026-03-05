{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    
    profiles.default = {
      id = 0;
      isDefault = true;

      # --- SEARCH ENGINE CONFIG ---
      search = {
        default = "ddg";
        force = true;
        engines = {
          "ddg" = {
            urls = [
              { template = "https://noai.duckduckgo.com/?q={searchTerms}"; }
              {
                template = "https://ac.duckduckgo.com/ac/?q={searchTerms}&type=list";
                type = "application/x-suggestions+json";
              }
            ];
            definedAliases = [ "@ddg" ];
          };

          "google".metaData.hidden = true;
          "bing".metaData.hidden = true;
          "amazondotcom-us".metaData.hidden = true;
          "ebay".metaData.hidden = true;
          "wikipedia".metaData.hidden = true;
        };
      };

      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          proton-pass
          istilldontcareaboutcookies
          nicothin-space
        ];
      };

      settings = {
        "browser.urlbar.showSearchSuggestionsFirst" = true;
        "browser.urlbar.suggest.searches" = true;          
        "browser.search.suggest.enabled" = true;        
        
        "browser.urlbar.groupLabels.enabled" = false;   
        "browser.urlbar.quicksuggest.enabled" = false;    
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = true;
        "browser.urlbar.suggest.recentsearches" = false;

        "browser.urlbar.autoFill" = true;                  
        "browser.urlbar.inlineComplete" = true;       
        "browser.urlbar.suggest.history" = true;            
        "browser.urlbar.suggest.bookmark" = true;  
        "browser.urlbar.suggest.openpage" = true;         
        "browser.urlbar.suggest.engines" = false;     
        "browser.urlbar.suggest.topsites" = false;      
        "browser.urlbar.maxHistoricalSearchSuggestions" = 0;

        "browser.urlbar.trending.featureGate" = false;   
        "browser.urlbar.addons.featureGate" = false;  
        "browser.urlbar.mdn.featureGate" = false;           
        "browser.urlbar.pocket.featureGate" = false;              
        "browser.urlbar.weather.featureGate" = false;              
        "browser.urlbar.clipboard.featureGate" = false;            
        "browser.urlbar.suggest.dataCollection" = false;

        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.server" = "";
        "app.shield.optoutstudies.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;

        "browser.startup.page" = 1;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.aboutwelcome.enabled" = false;
        "startup.homepage_welcome_url" = "";
        "startup.homepage_welcome_url.additional" = ""; 
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.tabs.closeWindowWithLastTab" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "datareporting.policy.dataSubmissionPolicyAccepted" = true;

        "browser.newtabpage.enabled" = true;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = true;

        "browser.theme.toolbar-theme" = 1;
        "extensions.activeThemeID" = "{22b0eca1-8c02-4c0d-a5d7-6604ddd9836e}";

        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;

        "browser.translations.automaticallyPopup" = false;
        "extensions.postDownloadThirdPartyPrompt" = false;
        "browser.tabs.warnOnClose" = false;

        "extensions.webservice.discoverURL" = "";

        "signon.rememberSignons" = false;         
        "signon.autofillForms" = false;          
        "signon.generation.enabled" = false;      

        "browser.uiCustomization.state" = builtins.toJSON {
          placements = {
            widget-overflow-fixed-list = [];
            unified-extensions-area = [];
            nav-bar = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "downloads-button"
              "urlbar-container"
              "78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action"
              "ublock0_raymondhill_net-browser-action"
            ];
            toolbar-menubar = [ "menubar-items" ];
            TabsToolbar = [
              "tabbrowser-tabs"
              "new-tab-button"
              "alltabs-button"
            ];
            vertical-tabs = [];
            PersonalToolbar = [];
          };
          seen = [
            "78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action"
            "ublock0_raymondhill_net-browser-action"
          ];
          dirtyAreaCache = [ "nav-bar" ];
          currentVersion = 23;
          newElementCount = 0;
        };
      };
    };
  };
}