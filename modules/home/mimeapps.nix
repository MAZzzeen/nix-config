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
        neovim = {
          name = "Neovim";
          genericName = "Text Editor";
          exec = "alacritty --command nvim %F";
          terminal = false;
          comment = "Launch Neovim in Alacritty";
          mimeType = ["text/*"];
        };
      };
    };
  };
}
