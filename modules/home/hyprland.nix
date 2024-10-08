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
        bind = SUPER, Return, exec, alacritty
        bind = SUPER, C, killactive,
        bind = SUPER, M, exit,
        bind = SUPER, E, exec, thunar
        bind = SUPER, V, togglefloating,
        bind = SUPER, Space, exec, rofi -show drun -show-icons
        bind = SUPER, P, pseudo,
        bind = SUPER, J, togglesplit,
        bind = SUPER, Escape, exec, wlogout
        bind = SUPER, F, fullscreen,

        bind =, Print, exec, slurp | grim -g - - | wl-copy
        bind = Shift, Print, exec, grim - | wl-copy

        bind = SUPER, left, movefocus, l
        bind = SUPER, right, movefocus, r
        bind = SUPER, up, movefocus, u
        bind = SUPER, down, movefocus, d

        bind = SUPER, 1, workspace, 1
        bind = SUPER, 2, workspace, 2
        bind = SUPER, 3, workspace, 3
        bind = SUPER, 4, workspace, 4
        bind = SUPER, 5, workspace, 5
        bind = SUPER, 6, workspace, 6
        bind = SUPER, 7, workspace, 7
        bind = SUPER, 8, workspace, 8
        bind = SUPER, 9, workspace, 9
        bind = SUPER, 0, workspace, 10

        bind = SUPER SHIFT, 1, movetoworkspace, 1
        bind = SUPER SHIFT, 2, movetoworkspace, 2
        bind = SUPER SHIFT, 3, movetoworkspace, 3
        bind = SUPER SHIFT, 4, movetoworkspace, 4
        bind = SUPER SHIFT, 5, movetoworkspace, 5
        bind = SUPER SHIFT, 6, movetoworkspace, 6
        bind = SUPER SHIFT, 7, movetoworkspace, 7
        bind = SUPER SHIFT, 8, movetoworkspace, 8
        bind = SUPER SHIFT, 9, movetoworkspace, 9
        bind = SUPER SHIFT, 0, movetoworkspace, 10

        bind = SUPER, S, togglespecialworkspace, magic
        bind = SUPER SHIFT, S, movetoworkspace, special:magic

        bind = SUPER, mouse_down, workspace, e+1
        bind = SUPER, mouse_up, workspace, e-1

        bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
        bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
        bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

        bindl = , XF86AudioNext, exec, playerctl next
        bindl = , XF86AudioPause, exec, playerctl play-pause
        bindl = , XF86AudioPlay, exec, playerctl play-pause
        bindl = , XF86AudioPrev, exec, playerctl previous
        windowrule = float, ^(nekobox)$
        windowrulev2 = suppressevent maximize, class:.*
      '';
      importantPrefixes = ["$" "bezier" "name" "source"];
      plugins = [];
      settings = {
        monitor = [",preferred,auto,1" "FALLBACK,1920x1080@60,auto,1"];
        bindm = ["SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow"];
        exec-once = "hyprpaper & lxsession & hypridle & mako & wl-paste --watch cliphist store & waybar";
        general = {
          gaps_in = 8;
          gaps_out = 20;

          border_size = 2;

          "col.active_border" = "rgba(8fbcbbee) rgba(5e81acee) 45deg";
          "col.inactive_border" = "rgba(3b4252aa)";

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
          "col.shadow" = "rgba(1a1a1aee)";

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
