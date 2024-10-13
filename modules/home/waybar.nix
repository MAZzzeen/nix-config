{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    waybar.enable = lib.mkEnableOption "enables waybar";
  };
  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 40;
          width = 2420;
          margin-top = 12;
          margin-bottom = -8;

          modules-left = ["custom/Archmenubutton" "hyprland/workspaces"];
          modules-center = ["hyprland/window"];
          modules-right = ["tray" "group/rest" "custom/powerbutton"];

          "group/rest" = {
            orientation = "inherit";
            modules = [
              "custom/clipboard"
              "wireplumber"
              "hyprland/language"
              "clock"
            ];
          };
          "hyprland/window" = {
            format = "{}";
            rewrite = {
              "(.*) - Chromium(.*)" = "Chromium";
              "(.*) - Thunar(.*)" = "Thunar";
              "(.*) — Mozilla Firefox(.*)" = "Mozilla Firefox";
            };
          };
          "custom/Archmenubutton" = {
            format = "󱄅";
            tooltip = false;
            on-click = "rofi -show drun -show-icons";
          };
          "custom/powerbutton" = {
            format = "󰤆";
            tooltip = false;
            on-click = "wlogout";
          };
          "clock" = {
            interval = 60;
            tooltip = true;
            format = "󰥔  {:%H:%M}";
            tooltip-format = "   {:%Y %m %d}";
          };
          "hyprland/language" = {
            format = "󰌌   {}";
            format-en = "Eng";
            format-ar = "Ar";
          };
          "wireplumber" = {
            format = "{icon}    {volume}%";
            format-muted = "";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            scroll-step = 5;
            format-icons = ["" "" ""];
          };
          "custom/clipboard" = {
            format = "󰅇   Clipboard";
            tooltip = false;
            on-click = "cliphist list | rofi -dmenu | cliphist decode | wl-copy";
          };
          "tray" = {
            icon-size = 21;
            spacing = 10;
          };
          "hyprland/workspaces" = {
            format = "{icon}";
            format-icons = {
              "1" = "";
              "2" = "";
              "3" = "";
              "4" = "";
              "5" = "";
              "default" = "";
            };
            persistent-workspaces = {
              "*" = 5;
              "HDMI-A-1" = 3;
            };
          };
        };
      };
      style = with config.lib.stylix.colors.withHashtag; ''
        window#waybar {
            color: white;
            border-radius: 20px;
        }

        #workspaces {
          border: 0px solid ${base03};
          border-radius: 20px;
          background: ${base03} ;
          padding-left: 8px;
          padding-right: 12px;
          margin-top: 4px;
          margin-bottom: 4px;
          margin-left: 9px;
        }

        #workspaces button {
          padding-left: 10px;
          padding-right: 10px;
          background: transparent;
          color: ${base06};
          font-size: 15px;
        }

          tooltip {
          background: ${base02};
        }

        tooltip label {
          color: ${base04};


        #workspaces button.empty {
          color: #000000;


        #workspaces button.active {
          color: ${base0B};


        #workspaces button.urgent {
          color: ${base08};
        }

        #workspaces button:hover {
          border: none;
          text-shadow: none;
          background: none;
          box-shadow: none;
        }

        #custom-Archmenubutton {
          padding-left: 20px;
          padding-right: 25px;
          border-radius: 20px;
          margin: 4px;
          font-size: 20px;
          background: ${base04};
          color: #5e81ac;
        }

        #window {
          color: ${base04};
          font-size: 16px;
        }

        #custom-powerbutton {
          background: ${base08};
          color: ${base04};
          border-radius: 20px;
          margin: 4px;
          padding-left: 20px;
          padding-right: 25px;
          font-size: 20px;
        }

        #rest {
          background: ${base00};
          border-radius: 20px;
          margin: 4px;
          padding-left: 20px;
          padding-right: 20px;
          margin-right: 8px;
        }

        #clock {
          padding-left: 25px;
          color: ${base0A};
        }

        #wireplumber {
          padding-left: 25px;
          color: ${base0D};
        }

        #language {
          padding-left: 25px;
          color: ${base0C};
        }

        #tray {
          padding-right: 10px;
        }

        #custom-clipboard {
          color: ${base07};
        }
      '';
    };
  };
}
