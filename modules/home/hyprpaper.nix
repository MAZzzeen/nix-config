{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprpaper.enable = lib.mkEnableOption "enables hyprpaper";
  };
  config = lib.mkIf config.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = ["$HOME/Pictures/Backgrounds/wallhaven-md7591.jpg"];
        wallpaper = ["DP-1,$HOME/Pictures/Backgrounds/wallhaven-md7591.jpg"];
      };
    };
  };
}
