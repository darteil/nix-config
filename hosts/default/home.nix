{ pkgs, outputs, ... }:

let
  vars = import ./variables.nix;
in
{
  nixpkgs = {
    overlays = [
      # When applied, the unstable nixpkgs set
      #
      # Example:
      # programs.bottom = {
      #   enable = true;
      #   package = pkgs.unstable.bottom;
      # };
      outputs.overlays.unstable-packages
      outputs.overlays.gnomeExtensions
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  imports = [
    ../../home-manager/programs/fish.nix
    ../../home-manager/programs/tmux.nix
    ../../home-manager/programs/git.nix
    ./dotfiles.nix
  ];

  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
    stateVersion = "25.11";

    pointerCursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Adw";
      size = 22;
    };

    # sessionVariables = {
    #   EDITOR = "nvim";
    # };
  };

  home.packages = with pkgs; [
    gnome-calculator
    gnome-bluetooth
    gnome-clocks
    gnome-tweaks
    gnome-font-viewer
    gnome-system-monitor
    nautilus
    celluloid
    decibels
    papers
    loupe
    eyedropper
    kooha
    shortwave

    gnomeExtensions.arcmenu
    gnomeExtensions.status-area-horizontal-spacing
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.uppercase-input-source-indicator
    gnomeExtensions.quake-terminal
  ];

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Simp1e-Adw";
      package = pkgs.simp1e-cursors;
      size = 22;
    };
  };

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

  programs.home-manager.enable = true;
}
