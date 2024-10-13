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
      enable = true;
      polarity = "dark";
      image = ./../../Backgrounds/Wallpaper.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
      fonts = {
        serif = config.stylix.fonts.sansSerif;

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        monospace = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };
}
