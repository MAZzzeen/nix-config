{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    yazi.enable = lib.mkEnableOption "enables yazi";
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
    };
  };
}
