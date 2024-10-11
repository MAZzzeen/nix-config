{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  home.username = "maz";
  home.homeDirectory = "/home/maz";

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./../../modules/home/configs.nix
  ];

  alacritty.enable = true;
  fastfetch.enable = true;
  hypridle.enable = true;
  mako.enable = true;
  nixvim.enable = true;
  starship.enable = true;
  wlogout.enable = true;
  cava.enable = true;
  gtktheme.enable = true;
  hyprland.enable = true;
  hyprlock.enable = true;
  hyprpaper.enable = true;
  mpv.enable = true;
  qttheme.enable = true;
  firefox.enable = true;
  waybar.enable = true;
  zsh.enable = true;
  mimeapps.enable = true;
  rofi.enable = true;
  yazi.enable = true;

  programs.bash.enable = true;

  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    lutris
    alacritty
    wineWowPackages.staging
    winetricks
    cliphist
    grim
    alejandra
    cava
    zathura
    qbittorrent
    ueberzugpp
    eza
    lxde.lxsession
    btop
    nsxiv
    slurp
    wl-clipboard
    (prismlauncher.override {jdks = [temurin-jre-bin-21 temurin-jre-bin-8 temurin-jre-bin-17];})
  ];

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/vnd.microsoft.portable-executable" = "wine";
      "text/plain" = "Alacritty.desktop;neovim.desktop;neovide.desktop;nvim.desktop;";
      "application/zip" = "org.gnome.FileRoller.desktop;";
    };
    defaultApplications = {
      "application/vnd.microsoft.portable-executable" = "wine";
    };
  };

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    XCURSOR_SIZE = 24;
    HYPRCURSOR_SIZE = 24;
    WINEPREFIX = "$HOME/.local/share/wine";
    NIXOS_OZONE_WL = "1";
    CARGO_HOME = "$HOME/.local/share/cargo";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$HOME/.config/java";
    XCURSOR_PATH = "/usr/share/icons:$HOME/.local/share/icons";
    GNUPGHOME = "$HOME/.local/share/gnupg";
    TERM = "alacritty";
  };

  programs.home-manager.enable = true;
}
