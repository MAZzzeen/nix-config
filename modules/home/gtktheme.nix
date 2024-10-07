{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    gtktheme.enable = lib.mkEnableOption "enables gtktheme";
  };
  config = lib.mkIf config.gtktheme.enable {
    gtk = {
      enable = true;

      theme.package = pkgs.nordic;
      theme.name = "Nordic-darker";

      gtk3.extraConfig = {gtk-application-prefer-dark-theme = true;};
      gtk4.extraConfig = {gtk-application-prefer-dark-theme = true;};

      cursorTheme.package = pkgs.material-cursors;
      cursorTheme.name = "Material_dark_cursors";

      iconTheme.package = pkgs.qogir-icon-theme;
      iconTheme.name = "Qogir-dark";
    };
  };
}
