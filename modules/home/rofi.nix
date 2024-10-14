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
        display-drun = "Apps:";
        display-emoji = "Emoji:";
        display-dmenu = "Clipboard:";
        modi = "drun,emoji";
        show-icons = true;
      };
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "window" = {
          "margin" = "20";
          "width" = "45%";
        };
      };
    };
  };
}
