{ pkgs, ... }:

let
  addons = pkgs.nur.repos.rycee.firefox-addons;

  # Shared across every profile
  baseExtensions = with addons; [
    ublock-origin
    sponsorblock
    decentraleyes
    bitwarden
  ];

  baseSettings = {
    "extensions.autoDisableScopes" = 0;

    # Updates are managed by Nix; see policies.DisableAppUpdate below
    "app.update.auto" = false;

    # HTTPS-Only Mode
    "dom.security.https_only_mode" = true;
    "dom.security.https_only_mode_ever_enabled" = true;

    # Privacy
    "privacy.donottrackheader.enabled" = true;
    "privacy.trackingprotection.enabled" = true;
    "privacy.trackingprotection.socialtracking.enabled" = true;

    # Telemetry
    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
    "browser.newtabpage.activity-stream.telemetry" = false;
    "browser.ping-centre.telemetry" = false;
    "toolkit.telemetry.archive.enabled" = false;
    "toolkit.telemetry.bhrPing.enabled" = false;
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.firstShutdownPing.enabled" = false;
    "toolkit.telemetry.hybridContent.enabled" = false;
    "toolkit.telemetry.newProfilePing.enabled" = false;
    "toolkit.telemetry.reportingpolicy.firstRun" = false;
    "toolkit.telemetry.shutdownPingSender.enabled" = false;
    "toolkit.telemetry.unified" = false;
    "toolkit.telemetry.updatePing.enabled" = false;

    # Experiments
    "experiments.activeExperiment" = false;
    "experiments.enabled" = false;
    "experiments.supported" = false;
    "network.allow-experiments" = false;

    # New tab / general
    "browser.formfill.enable" = false;
    "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
    "browser.newtabpage.activity-stream.feeds.snippets" = false;
    "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
    "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
    "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
    "browser.newtabpage.activity-stream.showSponsored" = false;
    "browser.newtabpage.activity-stream.system.showSponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
  };

  # Helper: declare a bookmarks toolbar from a plain list
  toolbar = items: {
    force = true;
    settings = [{
      name = "toolbar";
      toolbar = true;
      bookmarks = items;
    }];
  };
in
{
  programs.firefox = {
    enable = true;

    # Enforced globally rather than via (nonexistent) per-profile prefs
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };

    profiles = {
      default = {
        id = 0;
        isDefault = true;
        name = "default";

        extensions.packages = baseExtensions ++ (with addons; [
          tampermonkey
          old-reddit-redirect
          reddit-enhancement-suite
          betterttv
          frankerfacez
          enhancer-for-youtube
          musescore-downloader
        ]);

        settings = baseSettings // {
          "browser.toolbars.bookmarks.visibility" = "never";
        };
      };

      work = {
        id = 1;
        name = "work";
        extensions.packages = baseExtensions;
        settings = baseSettings;

        bookmarks = toolbar [
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
            url = "https://sites.google.com/fusdk12.net/mustang-memo";
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
      };

      omscs = {
        id = 2;
        name = "omscs";
        extensions.packages = baseExtensions ++ [ addons.unpaywall ];
        settings = baseSettings;

        bookmarks = toolbar [
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
      };
    };
  };
}
