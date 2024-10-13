{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    alacritty.enable = lib.mkEnableOption "enables alacritty";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font.normal = lib.mkForce {
          family = "FiraCode Nerd Font Mono";
          style = "Regular";
        };
        font = {
          size = 12;
        };
        window = {
          dynamic_padding = true;
          decorations = "Full";
          blur = false;
        };
        window.padding = {
          x = 18;
          y = 18;
        };
        window.dimensions = {
          columns = 100;
          lines = 22;
        };
      };
    };
  };
}
