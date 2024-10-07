{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprlock.enable = lib.mkEnableOption "enables hyprlock";
  };
  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      importantPrefixes = ["$" "monitor" "size" "source"];
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 0;
          hide_cursor = false;
          no_fade_out = true;
          no_fade_in = true;
        };
        background = [
          {
            path = "$HOME/Pictures/Backgrounds/wallhaven-qz6dz5.jpg";
            blur_passes = 2;
            contrast = 1;
            brightness = 0.5;
            vibrancy = 0.2;
            vibrancy_darkness = 0.2;
          }
        ];
        label = [
          {
            text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
            color = "rgba(242, 243, 244, 0.75)";
            font_size = 22;
            font_family = "JetBrains Mono";
            position = "0, 300";
            halign = "center";
            valign = "center";
          }
          {
            text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
            color = "rgba(242, 243, 244, 0.75)";
            font_size = 95;
            font_family = "JetBrains Mono Extrabold";
            position = "0, 200";
            halign = "center";
            valign = "center";
          }
          {
            text = ''cmd[update:1000] echo "$($HOME/.config/whoami.sh)"'';
            color = "rgba(216,222,233,1)";
            font_size = 14;
            font_family = "JetBrains Mono";
            position = "0, -10";
            halign = "center";
            valign = "top";
          }
        ];
        input-field = [
          {
            size = "250, 60";
            outline_thickness = 2;
            dots_size = 0.2;
            dots_spacing = 0.35;
            dots_center = true;
            outer_color = "rgba(0, 0, 0, 0)";
            inner_color = "rgba(0, 0, 0, 0.2)";
            font_color = "rgba(216,222,233,1)";
            fade_on_empty = false;
            rounding = -1;
            check_color = "rgb(204, 136, 34)";
            placeholder_text = ''<i><span foreground="##cdd6f4">Input Password...</span></i>'';
            hide_input = false;
            position = "0, -200";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
