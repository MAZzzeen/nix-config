{
  pkgs,
  lib,
  config,
  ...
}: let
  wallpaperDir = builtins.path {
    name = "wallpapers";
    path = "${./../../Backgrounds}"; # Adjust this based on your directory structure
  };
in {
  options = {
    hyprpaper.enable = lib.mkEnableOption "enables hyprpaper";
  };
  config = lib.mkIf config.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = ["${wallpaperDir}/wallhaven-md7591.jpg"];
        wallpaper = ["DP-1,${wallpaperDir}/wallhaven-md7591.jpg"];
      };
    };
  };
}
