{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    yazi.enable = lib.mkEnableOption "enables rofi";
  };
  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          sort_dir_first = true;
          show_hidden = true;
        };
        preview = {
          wrap = "yes";
        };
      };
    };
  };
}
