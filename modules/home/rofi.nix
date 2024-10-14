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
        "*" = {
          width = mkLiteral "30%";
        };

        "#inputbar" = {
          children = map mkLiteral ["prompt" "entry"];
        };

        "#textbox-prompt-colon" = {
          expand = false;
          str = ":";
          margin = mkLiteral "0px 0.3em 0em 0em";
          text-color = mkLiteral "@foreground-color";
        };
      };
    };
  };
}
