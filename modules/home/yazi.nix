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
          scrolloff = 5;
        };
        opener = ''
          edit = [
            {
              run = "nvim '$@'";
              block = true;
            }
          ];
          play = [
            {
              run = "mpv '$@'";
              orphan = true;
            }
          ];
          read = [
            {
              run = "zathura '$@'";
              orphan = true;
            }
          ];
          view = [
            {
              run = "nsxiv '$@'";
              orphan = true;
            }
          ];
          open = [
            {
              run = "xdg-open '$@'";
              desc = "Open";
            }
          ];
        '';
        preview = {
          wrap = "yes";
        };
        open = {
          append_rules = [
            {
              name = "*";
              use = "open";
            }
          ];
          rules = [
            {
              mime = "text/*";
              use = "edit";
            }
            {
              mime = "video/*";
              use = "play";
            }
            {
              mime = "audio/*";
              use = "play";
            }
            {
              mime = "applications/pdf";
              use = "read";
            }
            {
              name = "*.cbr";
              use = "read";
            }
            {
              name = "*.epub";
              use = "read";
            }
            {
              name = "*.djvu";
              use = "read";
            }
          ];
        };
      };
    };
  };
}
