{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    kitty.enable = lib.mkEnableOption "enables kitty";
  };
  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      settings = {
        placement_strategy = "center";
        window_padding_width = 5;
        hide_window_decorations = "yes";
        confirm_os_window_close = 0;
        allow_remote_control = "yes";
        tab_bar_edge = "top";
      };
    };
  };
}
