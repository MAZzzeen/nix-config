{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = ''
        windowrule = float, ^(nekobox)$
        windowrulev2 = suppressevent maximize, class:.*
      '';
      importantPrefixes = ["$" "bezier" "name" "source"];
      plugins = [];
      settings = {
        monitor = [",preferred,auto,auto" "FALLBACK,1920x1080@60,auto,1"];
        bindm = ["SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow"];
        bindl = [
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ];
        bindel = [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ];
        bind = [
          "SUPER, Return, exec, alacritty"
          "SUPER, C, killactive,"
          "SUPER, M, exit,"
          "SUPER, E, exec, alacritty --command yazi"
          "SUPER, V, togglefloating,"
          "SUPER, Space, exec, rofi -show drun -show-icons"
          "SUPER, P, pseudo,"
          "SUPER, J, togglesplit,"
          "SUPER, Escape, exec, wlogout"
          "SUPER, F, fullscreen,"

          ", Print, exec, slurp | grim -g - - | wl-copy"
          "Shift, Print, exec, grim - | wl-copy"

          "SUPER, left, movefocus, l"
          "SUPER, right, movefocus, r"
          "SUPER, up, movefocus, u"
          "SUPER, down, movefocus, d"

          "SUPER, 1, workspace, 1"
          "SUPER, 2, workspace, 2"
          "SUPER, 3, workspace, 3"
          "SUPER, 4, workspace, 4"
          "SUPER, 5, workspace, 5"
          "SUPER, 6, workspace, 6"
          "SUPER, 7, workspace, 7"
          "SUPER, 8, workspace, 8"
          "SUPER, 9, workspace, 9"
          "SUPER, 0, workspace, 10"

          "SUPER SHIFT, 1, movetoworkspace, 1"
          "SUPER SHIFT, 2, movetoworkspace, 2"
          "SUPER SHIFT, 3, movetoworkspace, 3"
          "SUPER SHIFT, 4, movetoworkspace, 4"
          "SUPER SHIFT, 5, movetoworkspace, 5"
          "SUPER SHIFT, 6, movetoworkspace, 6"
          "SUPER SHIFT, 7, movetoworkspace, 7"
          "SUPER SHIFT, 8, movetoworkspace, 8"
          "SUPER SHIFT, 9, movetoworkspace, 9"
          "SUPER SHIFT, 0, movetoworkspace, 10"

          "SUPER, S, togglespecialworkspace, magic"
          "SUPER SHIFT, S, movetoworkspace, special:magic"

          "SUPER, mouse_down, workspace, e+1"
          "SUPER, mouse_up, workspace, e-1"
        ];
        exec-once = "hyprpaper & lxsession & hypridle & mako & wl-paste --watch cliphist store & waybar";
        general = {
          gaps_in = 8;
          gaps_out = 20;

          border_size = 2;

          resize_on_border = false;

          layout = "dwindle";
        };
        decoration = {
          rounding = 15;

          active_opacity = 1.0;
          inactive_opacity = 1.0;

          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;

          blur = {
            enabled = true;
            size = 2;
            passes = 4;

            vibrancy = 0.1696;
          };
        };
        animations = {
          enabled = true;

          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

          animation = [
            "windows, 1, 5, myBezier"
            "windowsOut, 1, 5, default, popin 80%"
            "border, 1, 3, default"
            "borderangle, 1, 3, default"
            "fade, 1, 4, default"
            "workspaces, 1, 3, default"
          ];
        };
        input = {
          kb_layout = "us, eg";
          kb_options = "grp:alt_shift_toggle";
          kb_rules = "evdev";

          follow_mouse = 1;

          accel_profile = "flat";

          sensitivity = 0;
          numlock_by_default = true;
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
      };
    };
  };
}
