{ config, pkgs, ... }:

let
  firefoxProfileName = "TeodorDefaultProfile";
  thunderbirdProfileName = "TeodorDefaultProfile";
in

{
  programs.firefox = {
    enable = true;

    policies = {
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      AutofillCreditCardEnabled = false;
      Cookies = {
        Behavior = "reject-foreign";
        Locked = true;
      };
      DisableFirefoxAccounts  = true;
      DisableAccounts = true;
      DisableMasterPasswordCreation = true;
      EnableTrackingProtection  = {
        Value = true;
        Cryptomining  =  true;
        Fingerprinting  =  true;
        EmailTracking = true;
        Locked  = true;
      };
      HttpsOnlyMode = "force_enabled";
      NoDefaultBookmarks  = true;
      OfferToSaveLogins = false;
      DisableProfileImport  = true;
      FirefoxHome = {
        Search  = true;
        TopSites  = true;
        SponsoredTopSites = false;
        Highlights  = false;
        Pocket  = false;
        SponsoredPocket = false;
        Snippets  = false;
        Locked  = true;
      };

      SanitizeOnShutdown  = {
        Cache = true;
        Cookies = true;
        Downloads = false;
        FormData  = false;
        History = false;
        Sessions  = false;
        SiteSettings  = true;
        OfflineApps = true;
        Locked  = true;
      };

      ExtensionSettings = with  builtins;
      let extension = shortId:  uuid: {
        name  = uuid;
        value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "normal_installed";
            };
          };
        in listToAttrs [
          # (extension "tree-style-tab" "treestyletab@piro.sakura.ne.jp")
          (extension "ublock-origin"  "uBlock0@raymondhill.net")
          # (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
          # (extension "tabliss" "extension@tabliss.io")
          # (extension "umatrix" "uMatrix@raymondhill.net")
          # (extension "libredirect" "7esoorv3@alefvanoon.anonaddy.me")
          (extension "clearurls"  "{74145f27-f039-47ce-a470-a662b129930a}")
          (extension  "keepasxc-browser"  "{76798791-c126-4156-9ae8-c30cc139a51a}")
        ];
    };



    profiles."${firefoxProfileName}" = {
      containers  = {
        teodor  = {
          color = "green";
          icon  = "briefcase";
          id  = 1;
        };
        netflix = {
          color = "red";
          icon  = "chill";
          id  = 2;
        };
        disneyplus  = {
          color = "blue";
          icon  = "chill";
          id  = 3;
        };
      };
      containersForce = true;


      search  = {
        force = true;
        default = "ddg";
        order = [ "ddg"  "google"  ];
        # privateDefault  = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "channel"; value = "unstable"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflage.svg";
            definedAliases = [ "@np" ];
          };

          "NixOS options" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "channel"; value = "master"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };

          "NixOS Wiki" = {
            urls = [{
              template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
              params = [
                { name = "search"; value = "{searchTerms}"; }
              ];
            }];
            icon = "https://wiki.nixos.org/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "@nw" ];
          };

          "bing".metaData.hidden = true;
          "google".metaData.alias = "@g";
          "wikipedia".metaData.alias = "@w";
        };
      };
      settings  = {
        "privacy.donottrackheader.enabled"  = true;
      };
    };
  };

  programs.thunderbird = {
    enable = true;
    profiles."${thunderbirdProfileName}" = {
      isDefault = true;
      settings  = {
        "network.cookie.cookieBehavior" = 1;
        "privacy.donottrackheader.enabled"  = true;
      };
    };
  };
}
