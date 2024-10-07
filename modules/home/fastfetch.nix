{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    fastfetch.enable = lib.mkEnableOption "enables fastfetch";
  };
  config = lib.mkIf config.fastfetch.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
        logo = {
          type = "small";
          padding = {
            bottom = 0;
          };
        };
        display = {
          separator = " |  ";
        };
        modules = [
          {
            type = "custom";
            format = "┌───────────────────────────────────────┐";
          }
          {
            type = "kernel";
            key = "";
            keyColor = "green";
          }
          {
            type = "wm";
            key = "";
            keyColor = "blue";
          }
          {
            type = "uptime";
            key = "󰅐";
            keyColor = "yellow";
          }
          {
            type = "packages";
            key = "󰏖";
            keyColor = "cyan";
          }
          {
            type = "shell";
            key = "";
            keyColor = "magenta";
          }
          {
            type = "custom";
            format = "└───────────────────────────────────────┘";
          }
        ];
      };
    };
  };
}
