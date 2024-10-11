{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    bash.enable = lib.mkEnableOption "enables bash";
  };
  config = lib.mkIf config.bash.enable {
    programs.bash = {
      enable = true;
      blesh = {
        enable = true;
      };
    };
  };
}
