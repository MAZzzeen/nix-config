{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    icons.enable = lib.mkEnableOption "enables icons";
  };
  config = lib.mkIf config.icons.enable {
    gtk = {
      enable = true;
      iconTheme.package = pkgs.qogir-icon-theme;
      iconTheme.name = "Qogir-dark";
    };
  };
}
