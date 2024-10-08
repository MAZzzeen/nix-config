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
      style = ''
        window#waybar {
            background: #3b4252;
            /* border-bottom: 3px solid rgba(100, 114, 125, 0.5); */
            color: white;
            border-radius: 20px;
            /* border: 8px solid #5e81ac; */
        }

        #workspaces {
          border: 0px solid #4c566a;
          border-radius: 20px;
          background: #4c566a;
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
          color: #eceff4;
          font-size: 15px;
        }

        tooltip {
          background: #434c5e;
          /* border: 1px solid rgba(100, 114, 125, 0.5) */;
        }

        tooltip label {
          color: #d8dee9;
        }

        #workspaces button.empty {
          color: #9399A5;
        }

        #workspaces button.active {
          color: #a3be8c;
        }

        #workspaces button.urgent {
          color: #bf616a;
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
          background: #d8dee9;
          color: #5e81ac;
        }

        /* .modules-right { */
        /*   background: #242933; */
        /*   margin: 4px; */
        /*   border-radius: 20px; */
        /*   padding-right: 15px; */
        /*   padding-left: 15px; */
        /* } */


        #window {
          color: #d8dee9;
          font-size: 16px;
        }

        #custom-powerbutton {
          background: #bf616a;
          color: #d8dee9;
          border-radius: 20px;
          margin: 4px;
          padding-left: 20px;
          padding-right: 25px;
          font-size: 20px;
        }

        #rest {
          background: #303643;
          border-radius: 20px;
          margin: 4px;
          padding-left: 20px;
          padding-right: 20px;
          margin-right: 8px;
        }

        #clock {
          padding-left: 25px;
          color: #ebcb8b;
        }

        #wireplumber {
          padding-left: 25px;
          color: #81a1c1;
        }

        #language {
          padding-left: 25px;
          color: #88c0d0;
        }

        #tray {
          padding-right: 10px;
        }

        #custom-clipboard {
          color: #8fbcbb;
        }
      '';
    };
  };
}
