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
    };
  };
}
