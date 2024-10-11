{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    fzf.enable = lib.mkEnableOption "enables fzf";
  };
  config = lib.mkIf config.fzf.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions = [
        "--border=rounded"
        "--height=30%"
      ];
    };
  };
}
