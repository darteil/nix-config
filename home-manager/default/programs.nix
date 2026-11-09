{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papirus-icon-theme
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
    qbittorrent

    figma-linux
    vivaldi
    google-chrome
    qutebrowser
    hydrapaper
    zoom-us
    telegram-desktop
    neovim
    tig

    gnomeExtensions.arcmenu
    gnomeExtensions.status-area-horizontal-spacing
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.uppercase-input-source-indicator
    gnomeExtensions.quake-terminal
    gnomeExtensions.tiling-shell
    gnomeExtensions.draw-on-gnome
    unstable.gnomeExtensions.status-tray

    # fonts
    maple-mono.truetype
    maple-mono.NF-unhinted
    ioskeley-mono.normal-NL
    dejavu_fonts
    nerd-fonts.ubuntu-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    corefonts
    vista-fonts
    roboto
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
    package = pkgs.unstable.vscode;
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
