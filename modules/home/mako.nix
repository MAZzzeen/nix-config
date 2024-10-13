{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    mako.enable = lib.mkEnableOption "enables mako";
  };
  config = lib.mkIf config.mako.enable {
    services.mako = {
      enable = true;
      width = 300;
      height = 110;
      margin = "15";
      icons = true;
      padding = "0,5,10";
      borderSize = 2;
      borderRadius = 15;
      layer = "overlay";
      anchor = "bottom-right";
      defaultTimeout = 5000;
      ignoreTimeout = true;
    };
  };
}
