{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-calculator
    gnome-bluetooth
    gnome-clocks
    gnome-tweaks
    gnome-font-viewer
    gnome-system-monitor
    gnome-text-editor
    nautilus
    celluloid
    decibels
    papers
    loupe
    eyedropper
    kooha
    shortwave

    figma-linux
    vivaldi
    google-chrome
    hydrapaper
    zoom-us
    telegram-desktop
    neovim
    tig

    gnomeExtensions.arcmenu
    gnomeExtensions.status-area-horizontal-spacing
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.uppercase-input-source-indicator
    gnomeExtensions.quake-terminal
    gnomeExtensions.tiling-shell
  ];

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultOptions = [
      "--style full"
      "--no-scrollbar"
      "--border none"
      "--list-border sharp"
      "--input-border sharp"
      "--header-border sharp"
      "--preview-border sharp"
      "--layout reverse"
      "--color=pointer:#76946A"
    ];
  };

  programs.vscode = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.keepassxc = {
    enable = true;
  };

  programs.thunderbird = {
    enable = true;
  };
}
