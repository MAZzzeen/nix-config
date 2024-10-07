{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    wlogout.enable = lib.mkEnableOption "enables wlogout";
  };
  config = lib.mkIf config.wlogout.enable {
    programs.wlogout = lib.mkIf config.wlogout.enable {
      enable = true;
      style = ''
        * {
        	background-image: none;
        	box-shadow: none;
        }

        window {
        	background-color: rgba(12, 12, 12, 0.9);
        }

        button {
            border-radius: 25;
            border-color: rgba(0, 0, 0, 0.5);
        	text-decoration-color: #d8dee9;
            color: #d8dee9;
        	background-color: #313742;
        	border-style: solid;
        	border-width: 5px;
        	background-repeat: no-repeat;
        	background-position: center;
        	background-size: 25%;
          margin: 30px;
        }

        button:focus, button:active, button:hover {
        	background-color: #414a59;
        	outline-style: none;
        }

        #lock {
            background-image: image(url("/home/maz/.nix-profile/share/wlogout/icons/lock.png"));
        }

        #logout {
            background-image: image(url("/home/maz/.nix-profile/share/wlogout/icons/logout.png"));
        }

        #suspend {
            background-image: image(url("/home/maz/.nix-profile/share/wlogout/icons/suspend.png"));
        }

        #hibernate {
            background-image: image(url("/home/maz/.nix-profile/share/wlogout/icons/hibernate.png"));
        }

        #shutdown {
            background-image: image(url("/home/maz/.nix-profile/share/wlogout/icons/shutdown.png"));
        }

        #reboot {
            background-image: image(url("/home/maz/.nix-profile/share/wlogout/icons/reboot.png"));
        }
      '';
      layout = [
        {
          label = "lock";
          action = "loginctl lock-session";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
        }
        {
          label = "logout";
          action = "loginctl terminate-user $USER";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Suspend";
          keybind = "u";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];
    };
  };
}
