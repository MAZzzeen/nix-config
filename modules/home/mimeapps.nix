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
        neovim = {
          name = "Neovim";
          genericName = "Text Editor";
          exec = "alacritty --command neovim %F";
          terminal = false;
          comment = "Text Editor";
          mimeType = ["text/*"];
        };
      };
    };
  };
}
