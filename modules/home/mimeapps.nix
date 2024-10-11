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
        nsxiv = {
          name = "Nsxiv";
          genericName = "Image Viewer";
          exec = "nsxiv %F";
          terminal = false;
          comment = "image viewer";
          mimeType = ["image/*"];
        };
      };
      mimeApps = {
        enable = true;
        associations.added = {
          "application/vnd.microsoft.portable-executable" = "wine.desktop";
          "text/plain" = "Alacritty.desktop;neovim.desktop;neovide.desktop;nvim.desktop;";
          "application/zip" = "org.gnome.FileRoller.desktop;";
          "image/*" = "nsxiv.desktop";
          "*.cbr" = "zathura.desktop";
        };
        defaultApplications = {
          "application/vnd.microsoft.portable-executable" = "wine.desktop";
          "image/*" = "nsxiv.desktop";
          "*.cbr" = "zathura.desktop";
        };
      };
    };
  };
}
