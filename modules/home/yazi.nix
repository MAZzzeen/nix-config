{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    yazi.enable = lib.mkEnableOption "enables rofi";
  };
  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          sort_dir_first = true;
          show_hidden = true;
          scrolloff = 5;
        };
        opener = {
          edit = [
            {
              run = ''nvim "$@"'';
              block = true;
            }
          ];
          play = [
            {
              run = ''mpv "$@"'';
              orphan = true;
            }
          ];
          read = [
            {
              run = ''zathura "$@"'';
              orphan = true;
            }
          ];
          view = [
            {
              run = ''nsxiv "$@"'';
              orphan = true;
            }
          ];
        };
        preview = {
          wrap = "yes";
        };
      };
    };
  };
}
