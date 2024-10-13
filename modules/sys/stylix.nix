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
      image = pkgs.fetchurl {
        url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
        sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
      };
      base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
      autoEnable = true;
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
