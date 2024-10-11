{
  lib,
  config,
  ...
}: {
  options = {mimeapps.enable = lib.mkEnableOption "enables mimeapps";};

  config = lib.mkIf config.mimeapps.enable {
    xdg = {
      enable = true;
      desktopEntries = {
        wine = {
          name = "Wine";
          genericName = "Windows Application";
          exec = "wine %F";
          terminal = false;
          comment = "Launch Windows application";
          mimeType = ["application/vnd.microsoft.portable-executable"];
        };
      };
      mimeApps = {
        enable = true;
        associations.added = {
          "application/vnd.microsoft.portable-executable" = "wine.desktop";
          "text/plain" = "Alacritty.desktop;neovim.desktop;neovide.desktop;nvim.desktop;";
          "application/zip" = "org.gnome.FileRoller.desktop;";
        };
        defaultApplications = {
          "application/vnd.microsoft.portable-executable" = "wine.desktop";
        };
      };
    };
  };
}
