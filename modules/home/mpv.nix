{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    mpv.enable = lib.mkEnableOption "enables mpv";
  };
  config = lib.mkIf config.mpv.enable {
    programs.mpv = {
      enable = true;

      bindings = {
      };

      package = (
        pkgs.mpv-unwrapped.wrapper {
          scripts = with pkgs.mpvScripts; [
            mpv-playlistmanager
            mpv-osc-modern
            mpv-notify-send
            mpris
            visualizer
          ];

          mpv = pkgs.mpv-unwrapped.override {
            waylandSupport = true;
          };
        }
      );

      defaultProfiles = ["idle"];

      profiles = {
        idle = {
          profile-cond = "p['idle-active']";
          profile-restore = "copy-equal";
          keepaspect = false;
          background = "tiles";
        };
      };

      scriptOpts = {
        playlistmanager = {
          key_showplaylist = "?";
          loadfiles_filetypes = ''["tif","tiff","gif","webp","svg","bmp","mp3","wav","ogm","flac","m4a","wma","ogg","opus","mkv","avi","mp4","ogv","webm","rmvb","flv","wmv","mpeg","mpg","m4v","3gp"]'';
          loadfiles_on_idle_start = true;
          loadfiles_on_start = true;
          style_ass_tags = ''{\fs22}'';
        };
        autoload = {
          disabled = false;
          images = false;
          videos = true;
          audio = true;
          additional_image_exts = "list,of,ext";
          additional_video_exts = "list,of,ext";
          additional_audio_exts = "list,of,ext";
          ignore_hidden = true;
          same_type = true;
          directory_mode = "recursive";
        };
        osc = {
          showwindowed = true;
          showfullscreen = true;
          scalewindowed = 0.8;
          scalefullscreen = 0.8;
          scaleforcedwindow = 0.8;
          vidscale = true;
          hidetimeout = 1000;
          fadeduration = 500;
          minmousemove = 3;
          iamaprogrammer = false;
          seekrange = true;
          seekrangealpha = 128;
          seekbarkeyframes = false;
          showtitle = true;
          timetotal = true;
          visibility = "auto";
          windowcontrols = false;
          volumecontrol = true;
          processvolume = true;
          language = "eng";
        };
      };

      config = {
        osc = false;
        profile = "high-quality";
        ytdl-format = "bestvideo+bestaudio";
        screenshot-format = "png";
        screenshot-png-compression = 4;
        screenshot-high-bit-depth = true;
        screenshot-tag-colorspace = true;
        osc-windowcontrols = false;
        screenshot-directory = "~/Pictures/";
      };
    };
  };
}
