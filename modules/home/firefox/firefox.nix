{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: let
  theme = builtins.path {
    name = "theme";
    path = "${./theme}"; # Adjust this based on your directory structure
  };
in {
  options = {
    firefox.enable = lib.mkEnableOption "enables firefox";
  };
  config =
    lib.mkIf config.qttheme.enable {
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
            userChrome = "
	      @import url(${theme}/all-global-positioning.css);
	      @import url(${theme}/all-color-schemes.css);

	      @import url(${theme}/function-sidebar-autohide.css);
	      @import url(${theme}/function-sidebery-autohide.css);
	      @import url(${theme}/function-privatemode.css); 
	      @import url(${theme}/function-urlbar.css);
	      @import url(${theme}/function-extensions-menu.css);

	      @import url(${theme}/theme-xstyle.css);
	      @import url(${theme}/theme-context-menu.css);
	      @import url(${theme}/theme-statuspanel.css);
	      @import url(${theme}/theme-findbar.css);
	      @import url(${theme}/theme-PIP.css);
	      @import url(${theme}/theme-tab-audio-indicator.css);
	    ";
            userContent = "
	      @import url(${theme}/website-styles.css);

	      @import url(${theme}/website-newtab.css);
  
	      @import url(${theme}/website-reddit.css);

	      @import url(${theme}/website-yt.css);

	      @import url(${theme}/website-private.css);
	    ";
            settings = {
              "extensions.autoDisableScopes" = 0;
              "user.theme.dark.a" = true;
              "user.theme.light.a" = true;
              "user.theme.dark.catppuccin" = false;
              "user.theme.dark.catppuccin-mocha" = false;
              "user.theme.dark.gruvbox" = false;
              "user.theme.light.gruvbox" = false;
              "user.theme.dark.midnight" = false;
              "user.theme.dark.nord" = false;
              "ultima.fix.gnome.titlebar" = false;
              "ultima.fix.gnome.titlebar.small" = false;
              "ultima.keep.titlebar" = true;
              "ultima.tabs.autohide" = false;
              "ultima.tabs.disabled" = false;
              "ultima.sidebar.autohide" = false;
              "ultima.sidebery.autohide" = true;
              "ultima.sidebar.hidden" = false;
              "ultima.sidebar.longer" = true;
              "ultima.theme.extensions" = true;
              "ultima.theme.color.swap" = true;
              "ultima.theme.icons" = true;
              "ultima.urlbar.suggestions" = true;
              "ultima.urlbar.centered" = true;
              "ultima.urlbar.hidebuttons" = false;
              "ultima.xstyle.urlbar" = false;
              "ultima.xstyle.containertabs.i" = false;
              "ultima.xstyle.containertabs.ii" = false;
              "ultima.xstyle.containertabs.iii" = true;
              "ultima.xstyle.lwtheme" = false;
              "ultima.xstyle.pinnedtabs.i" = false;
              "ultima.xstyle.private" = false;
              "ultima.xstyle.disable.alltabsbutton" = true;
              "browser.aboutConfig.showWarning" = false;
              "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
              "devtools.chrome.enabled" = true;
              "devtools.debugger.prompt-connection" = false;
              "svg.context-properties.content.enabled" = true;
              "toolkit.tabbox.switchByScrolling" = false;
              "sidebar.revamp" = true;
              "sidebar.verticalTabs" = true;
              "browser.tabs.hoverPreview.enabled" = true;
              "browser.newtabpage.activity-stream.newtabWallpapers.v2.enabled" = false;
              "media.videocontrols.picture-in-picture.enable-when-switching-tabs.enabled" = false;
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
              "toolkit.telemetry.server" = "data: =";
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
