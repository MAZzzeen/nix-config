{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    cava.enable = lib.mkEnableOption "enables cava";
  };
  config = lib.mkIf config.cava.enable {
    programs.cava = {
      enable = true;
      settings = {
        general.sensitivity = 100;
        output.channels = "mono";
        smoothing.noise_reduction = 90;
        color = {
          gradient = 1;
          gradient_count = 7;
          gradient_color_1 = "'#5e81ac'";
          gradient_color_2 = "'#6F91B6'";
          gradient_color_3 = "'#81a1c1'";
          gradient_color_4 = "'#84B0C8'";
          gradient_color_5 = "'#88c0d0'";
          gradient_color_6 = "'#8BC0D0'";
          gradient_color_7 = "'#8fbcbb'";
        };
      };
    };
  };
}
