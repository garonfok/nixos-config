{ pkgs, ... }: {
  programs.librewolf = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        isDefault = true;
        name = "default";
        extensions = {
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            sponsorblock
            decentraleyes
            bitwarden
            tampermonkey
            old-reddit-redirect
            reddit-enhancement-suite
            betterttv
            frankerfacez
            enhancer-for-youtube
            musescore-downloader
          ];
        };
        settings = {
          "extensions.autoDisableScopes" = 0;
          "update.autoUpdateDefault" = false;
          "update.enabled" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
        };
      };
      work = {
        id = 1;
        name = "work";
        extensions = {
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            sponsorblock
            decentraleyes
            bitwarden
          ];
        };
        settings = {
          "extensions.autoDisableScopes" = 0;
          "update.autoUpdateDefault" = false;
          "update.enabled" = false;
        };
        bookmarks = [
          {
            name = "toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Frontline Education";
                url = "https://app.frontlineeducation.com";
              }
              {
                name = "Aeries";
                url = "https://fremontusd.aeries.net/teacher/Default.aspx";
              }
              {
                name = "Mustang Memo";
                url = "sites.google.com/fusdk12.net/mustang-memo";
              }
              {
                name = "Frontline ERP";
                url = "https://fl-portal.acoe.org/#/login";
              }
              {
                name = "ParentSquare";
                url = "https://parentsquare.com";
              }
              {
                name = "Music Program Documentation";
                url = "https://fusd.canonlab.dev";
              }
            ];
          }
        ];
      };
      omscs = {
        id = 2;
        name = "omscs";
        extensions = {
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            sponsorblock
            decentraleyes
            bitwarden
            unpaywall
          ];
        };
        settings = {
          "extensions.autoDisableScopes" = 0;
          "update.autoUpdateDefault" = false;
          "update.enabled" = false;
        };
        bookmarks = [
          {
            name = "toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "Canvas";
                url = "https://gatech.instructure.com";
              }
              {
                name = "EdStem";
                url = "https://edstem.org/us/dashboard";
              }
              {
                name = "GitHub";
                url = "https://github.gatech.edu";
              }
            ];
          }
        ];
      };
    };
  };
}
