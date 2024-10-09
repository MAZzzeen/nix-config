{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: {
  options = {
    firefox.enable = lib.mkEnableOption "enables firefox";
  };
  config = lib.mkIf config.qttheme.enable {
    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          search = {
            force = true;
            engines = {
              "Brave Search" = {
                urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
              };
            };
            default = "Brave Search";
          };
          extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
            ublock-origin
            return-youtube-dislikes
            sponsorblock
            privacy-badger
          ];
          isDefault = true;
          settings = {
            "extensions.autoDisableScopes" = 0;
            "_user.js.parrot" = [
              "START: Oh yes, the Norwegian Blue... what's wrong with it?"
              "0100 syntax error: the parrot's dead!"
              "0200 syntax error: the parrot's definitely deceased!"
              "0300 syntax error: the parrot's not pinin' for the fjords!"
              "0400 syntax error: the parrot's passed on!"
              "0600 syntax error: the parrot's no more!"
              "0700 syntax error: the parrot's given up the ghost!"
              "0800 syntax error: the parrot's ceased to be!"
              "0900 syntax error: the parrot's expired!"
              "1000 syntax error: the parrot's gone to meet 'is maker!"
              "1200 syntax error: the parrot's a stiff!"
              "1600 syntax error: the parrot rests in peace!"
              "1700 syntax error: the parrot's bit the dust!"
              "2000 syntax error: the parrot's snuffed it!"
              "2400 syntax error: the parrot's kicked the bucket!"
              "2600 syntax error: the parrot's run down the curtain!"
              "2700 syntax error: the parrot's joined the bleedin' choir invisible!"
              "2800 syntax error: the parrot's bleedin' demised!"
              "4000 syntax error: the parrot's bereft of life!"
              "5000 syntax error: the parrot's taken 'is last bow"
              "5500 syntax error: this is an ex-parrot!"
              "6000 syntax error: the parrot's 'istory!"
              "7000 syntax error: the parrot's pushing up daisies!"
              "8000 syntax error: the parrot's crossed the Jordan"
              "9000 syntax error: the parrot's cashed in 'is chips!"
              "9999 syntax error: the parrot's shuffled off 'is mortal coil!"
            ];
            "browser.aboutConfig.showWarning" = false;
            "browser.startup.page" = 0;
            "browser.startup.homepage" = "about:blank";
            "browser.newtabpage.enabled" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.default.sites" = "";
            "geo.provider.ms-windows-location" = false;
            "geo.provider.use_corelocation" = false;
            "geo.provider.use_geoclue" = false;
            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "browser.discovery.enabled" = false;
            "browser.shopping.experience2023.enabled" = false;
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.server" = "data:,";
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.coverage.opt-out" = true;
            "toolkit.coverage.opt-out" = true;
            "toolkit.coverage.endpoint.base" = "";
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "app.shield.optoutstudies.enabled" = false;
            "app.normandy.enabled" = false;
            "app.normandy.api_url" = "";
            "breakpad.reportURL" = "";
            "browser.tabs.crashReporting.sendReport" = false;
            "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
            "captivedetect.canonicalURL" = "";
            "network.captive-portal-service.enabled" = false;
            "network.connectivity-service.enabled" = false;
            "browser.safebrowsing.downloads.remote.enabled" = false;
            "network.prefetch-next" = false;
            "network.dns.disablePrefetch" = true;
            "network.dns.disablePrefetchFromHTTPS" = true;
            "network.predictor.enabled" = false;
            "network.predictor.enable-prefetch" = false;
            "network.http.speculative-parallel-limit" = 0;
            "browser.places.speculativeConnect.enabled" = false;
            "network.proxy.socks_remote_dns" = true;
            "network.file.disable_unc_paths" = true;
            "network.gio.supported-protocols" = "";
            "browser.urlbar.speculativeConnect.enabled" = false;
            "browser.urlbar.quicksuggest.enabled" = false;
            "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
            "browser.urlbar.suggest.quicksuggest.sponsored" = false;
            "browser.search.suggest.enabled" = false;
            "browser.urlbar.suggest.searches" = false;
            "browser.urlbar.trending.featureGate" = false;
            "browser.urlbar.addons.featureGate" = false;
            "browser.urlbar.mdn.featureGate" = false;
            "browser.urlbar.pocket.featureGate" = false;
            "browser.urlbar.weather.featureGate" = false;
            "browser.urlbar.yelp.featureGate" = false;
            "browser.formfill.enable" = false;
            "browser.search.separatePrivateDefault" = true;
            "browser.search.separatePrivateDefault.ui.enabled" = true;
            "signon.autofillForms" = false;
            "signon.formlessCapture.enabled" = false;
            "network.auth.subresource-http-auth-allow" = 1;
            "browser.cache.disk.enable" = false;
            "browser.privatebrowsing.forceMediaMemoryCache" = true;
            "media.memory_cache_max_size" = 65536;
            "browser.sessionstore.privacy_level" = 2;
            "toolkit.winRegisterApplicationRestart" = false;
            "browser.shell.shortcutFavicons" = false;
            "security.ssl.require_safe_negotiation" = true;
            "security.tls.enable_0rtt_data" = false;
            "security.OCSP.enabled" = 1;
            "security.OCSP.require" = true;
            "security.cert_pinning.enforcement_level" = 2;
            "security.remote_settings.crlite_filters.enabled" = true;
            "security.pki.crlite_mode" = 2;
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_send_http_background_request" = false;
            "security.ssl.treat_unsafe_negotiation_as_broken" = true;
            "browser.xul.error_pages.expert_bad_cert" = true;
            "network.http.referer.XOriginTrimmingPolicy" = 2;
            "privacy.userContext.enabled" = true;
            "privacy.userContext.ui.enabled" = true;
            "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
            "media.peerconnection.ice.default_address_only" = true;
            "dom.disable_window_move_resize" = true;
            "browser.download.start_downloads_in_tmp_dir" = true;
            "browser.helperApps.deleteTempFileOnExit" = true;
            "browser.uitour.enabled" = false;
            "devtools.debugger.remote-enabled" = false;
            "permissions.manager.defaultsUrl" = "";
            "webchannel.allowObject.urlWhitelist" = "";
            "network.IDN_show_punycode" = true;
            "pdfjs.disabled" = false;
            "pdfjs.enableScripting" = false;
            "browser.tabs.searchclipboardfor.middleclick" = false;
            "browser.contentanalysis.enabled" = false;
            "browser.contentanalysis.default_result" = 0;
            "browser.download.useDownloadDir" = false;
            "browser.download.alwaysOpenPanel" = false;
            "browser.download.manager.addToRecentDocs" = false;
            "browser.download.always_ask_before_handling_new_types" = true;
            "extensions.enabledScopes" = 5;
            "extensions.postDownloadThirdPartyPrompt" = false;
            "browser.contentblocking.category" = "strict";
            "privacy.clearOnShutdown.cache" = true;
            "privacy.clearOnShutdown_v2.cache" = true;
            "privacy.clearOnShutdown.downloads" = true;
            "privacy.clearOnShutdown.formdata" = true;
            "privacy.clearOnShutdown.history" = true;
            "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
            "privacy.clearOnShutdown.cookies" = true;
            "privacy.clearOnShutdown.offlineApps" = true;
            "privacy.clearOnShutdown.sessions" = true;
            "privacy.clearOnShutdown_v2.cookiesAndStorage" = true;
            "privacy.clearOnShutdown.passwords" = true;
            "privacy.clearOnShutdown.vault" = true;
            "signon.rememberSignons" = false;
            "signon.prefillForms" = false;
            "extensions.screenshots.upload-disabled" = true;
            "browser.startup.homepage_override.mstone" = "ignore";
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
            "browser.urlbar.showSearchTerms.enabled" = false;
            "security.dialog_enable_delay" = 1000;
            "browser.link.open_newwindow.restriction" = 0;
            "extensions.webcompat.enable_shims" = true;
            "security.tls.version.enable-deprecated" = false;
            "extensions.webcompat-reporter.enabled" = false;
            "extensions.quarantinedDomains.enabled" = true;
          };
        };
      };
    };
  };
}
