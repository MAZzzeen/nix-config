{
  lib,
  config,
  pkgs,
  ...
}: let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "...";
    hash = "sha256-...";
  };
in {
  options = {
    yazi.enable = lib.mkEnableOption "enables rofi";
  };
  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      shellWrapperName = "y";
      settings = {
        manager = {
          sort_dir_first = true;
          scrolloff = 5;
        };
        preview = {
          wrap = "yes";
        };
      };
      # plugins = {
      #   full-border = "${yazi-plugins}/full-border.yazi";
      # };
      initLua = ''
        require("full-border"):setup()
      '';
    };
  };
}
