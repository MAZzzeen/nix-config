{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    sstylix.enable = lib.mkEnableOption "enables sstylix";
  };
  config = lib.mkIf config.sstylix.enable {
    stylix = {
      targets = {
        waybar = {
          enable = true;
          enableCenterBackColors = true;
          enableLeftBackColors = true;
          enableRightBackColors = true;
        };
      };
    };
  };
}
