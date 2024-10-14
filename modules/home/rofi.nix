{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    rofi.enable = lib.mkEnableOption "enables rofi";
  };
  config = lib.mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;
      plugins = [pkgs.rofi-emoji-wayland];
      package = pkgs.rofi-wayland;
      cycle = true;
      extraConfig = {
        display-drun = "";
        display-emoji = "󰞅";
        display-run = "";
        modi = "drun,run,emoji";
        show-icons = true;
      };
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        window = {
          transparency = "real";
          width = mkLiteral "600px";
          enabled = true;
          border-radius = mkLiteral "10px";
          cursor = mkLiteral "default";
        };
      };
    };
  };
}
