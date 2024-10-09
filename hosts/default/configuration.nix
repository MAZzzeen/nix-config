# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../modules/sys/main.nix
  ];

  tuigreet.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    optimise = {
      automatic = true;
      dates = ["03:45"];
    };
  };

  security.polkit.enable = true;

  environment.pathsToLink = ["/share/zsh"];

  networking = {
    networkmanager.enable = true;
    hostName = "maz-pc";
  };

  services = {
    playerctld.enable = true;
    tumbler.enable = true;
    gvfs.enable = true;
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
      videoDrivers = ["amdgpu"];
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
  };

  time.timeZone = "Africa/Cairo";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    xfconf.enable = true;
    file-roller.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  console.keyMap = "us";

  users.users.maz = {
    isNormalUser = true;
    home = "/home/maz";
    extraGroups = ["wheel" "networkmanager"];
    initialPassword = "123";
    shell = pkgs.zsh;
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono" "Inconsolata"];})
    ];
    fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    eza
    rofi-wayland
    tree
    mako
    killall
    waybar
    lxde.lxsession
    wlogout
    hyprpaper
    hypridle
    hyprlock
    qt5.qtwayland
    kdePackages.qtwayland
  ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "maz" = import ./home.nix;
    };
  };

  system.stateVersion = "24.05";
}
