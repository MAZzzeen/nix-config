{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    qttheme.enable = lib.mkEnableOption "enables qttheme";
  };
  config = lib.mkIf config.qttheme.enable {
    qt = {
      enable = true;
      platformTheme.name = "gtk3";
    };
  };
}
