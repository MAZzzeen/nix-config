{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh";
  };
  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      autosuggestion.enable = true;
      autosuggestion.strategy = ["history" "completion"];
      defaultKeymap = "emacs";
      syntaxHighlighting = {
        enable = true;
      };
      completionInit = "autoload -Uz compinit && compinit";
      dotDir = ".config/zsh";
      history = {
        append = true;
        ignoreAllDups = true;
        path = "$HOME/.config/.zhist";
        save = 100000;
        share = true;
      };
      initExtraBeforeCompInit = "fastfetch";
      envExtra = "
      WORDCHARS='*?[]~=&;!#$%^(){}<>'
      FZF_COMPLETION_TRIGGER='tab'
      ";
      initExtra = ''
               bindkey "^[[1;5C" forward-word
               bindkey "^[[1;5D" backward-word
               bindkey '^H' backward-kill-word
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
               eval "$(starship init zsh)"
      '';
      shellAliases = {
        ls = "eza --icons -la";
        ":q" = "exit";
        yeet = "sudo pacman -Rns";
        vi = "nvim";
        cls = "clear && fastfetch";
        cd = "z";
        rebuild-nix = "~/.config/nixos/rebuild.sh";
      };
    };
  };
}
