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
    nixpkgs.overlays = [
      (final: prev: {
        rofi-calc = prev.rofi-calc.override {rofi-unwrapped = prev.rofi-wayland-unwrapped;};
      })
    ];
    programs.rofi = {
      enable = true;
      plugins = [pkgs.rofi-calc];
      package = pkgs.rofi-wayland;
      cycle = true;
      extraConfig = {
        display-drun = "Apps:";
        display-emoji = "Emoji:";
        display-dmenu = "Clipboard:";
        modi = "drun,emoji";
        show-icons = true;
      };
    };
  };
}
