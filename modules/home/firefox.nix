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
      package = pkgs.floorp;
      profiles = {
        default = {
          search.engines = {
            "Brave Search" = {
              urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
            };
          };
          extensions = with inputs.firefox-addons.packages."x86_64-linux"; [ublock-origin return-youtube-dislikes sponsorblock privacy-badger];
          isDefault = true;
        };
      };
    };
  };
}
