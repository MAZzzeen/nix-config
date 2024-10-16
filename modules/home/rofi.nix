{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    rofi.enable = lib.mkEnableOption "enables rofi";
  };
  config = lib.mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;
      plugins = [pkgs.rofi-emoji-wayland];
      package = pkgs.rofi-wayland;
      cycle = true;
      extraConfig = {
        display-drun = "󱓞";
        display-emoji = "󰞅";
        display-run = "";
        modi = "drun,run,emoji";
        drun-display-format = "{name}";
        window-format = "{w} · {c} · {t}";
        show-icons = true;
      };
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
        with config.lib.stylix.colors.withHashtag; {
          window = {
            transparency = "real";
            width = mkLiteral "600px";
            enabled = true;
            border = mkLiteral "2px solid";
            border-radius = mkLiteral "15px";
            border-color = mkLiteral "${base0C}";
            cursor = mkLiteral "default";
          };
          mainbox = {
            enabled = true;
            spacing = mkLiteral "10px";
            margin = mkLiteral "0px";
            padding = mkLiteral "20px";
            border = mkLiteral "0px solid";
            background-color = mkLiteral "transparent";
            children = mkLiteral ''[ "inputbar", "message", "listview" ]'';
          };
          inputbar = {
            enabled = true;
            spacing = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            children = mkLiteral ''[ "textbox-prompt-colon", "entry", "mode-switcher" ]'';
          };
          prompt = {
            enabled = true;
          };
          textbox-prompt-colon = {
            enabled = true;
            padding = mkLiteral "5px 0px";
            expand = false;
            str = " ";
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
          };
          entry = {
            enabled = true;
            padding = mkLiteral "5px 0px";
            background-color = mkLiteral "inherit";
            cursor = mkLiteral "text";
            placeholder = "Search...";
            placeholder-color = mkLiteral "inherit";
          };
          num-filtered-rows = {
            enabled = true;
            expand = false;
          };
          textbox-num-sep = {
            enabled = true;
            expand = false;
            str = "/";
          };
          num-rows = {
            enabled = true;
            expand = false;
          };
          case-indicator = {
            enabled = true;
          };
          listview = {
            enabled = true;
            columns = 1;
            lines = 8;
            cycle = true;
            dynamic = true;
            scrollbar = true;
            layout = mkLiteral "vertical";
            reverse = false;
            fixed-height = true;
            fixed-columns = true;
            spacing = mkLiteral "5px";
            background-color = mkLiteral "transparent";
            cursor = "default";
          };
          scrollbar = lib.mkForce {
            handle-width = mkLiteral "5px";
            border-radius = mkLiteral "10px";
            background-color = mkLiteral "${base01}";
            handle-color = mkLiteral "${base03}";
          };
          element = {
            enabled = true;
            spacing = mkLiteral "10px";
            padding = mkLiteral "5px 10px";
            border-radius = mkLiteral "10px";
            background-color = mkLiteral "transparent";
            cursor = mkLiteral "pointer";
          };
          "element selected.normal" = lib.mkForce {
            background-color = mkLiteral "${base03}";
            text-color = mkLiteral "${base04}";
          };
          "element alternate.normal" = lib.mkForce {
            background-color = mkLiteral "${base00}";
            text-color = mkLiteral "${base04}";
          };
          element-icon = {
            size = mkLiteral "24px";
          };
          element-text = {
            vertical-align = mkLiteral "0.5";
            horizontal-align = 0;
          };
          mode-switcher = {
            enabled = true;
            spacing = mkLiteral "12px";
            background-color = mkLiteral "transparent";
          };
          button = lib.mkForce {
            padding = mkLiteral "5px 13px 5px 10px";
            background-color = mkLiteral "${base01}";
            text-color = mkLiteral "${base04}";
            border-radius = mkLiteral "10px";
            cursor = mkLiteral "pointer";
          };
          "button selected" = lib.mkForce {
            background-color = mkLiteral "${base03}";
            text-color = mkLiteral "${base04}";
          };
          message = {
            enabled = true;
            background-color = mkLiteral "transparent";
          };
          textbox = {
            padding = mkLiteral "8px 10px";
            border-radius = mkLiteral "10px";
            vertical-align = mkLiteral "0.5";
            horizontal-align = 0;
            highlight = mkLiteral "none";
            blink = true;
            markup = true;
          };
          error-message = {
            padding = mkLiteral "10px";
            border = mkLiteral "2px solid";
            border-radius = mkLiteral "10px";
          };
        };
    };
  };
}
