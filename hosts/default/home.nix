{ config, pkgs, outputs, inputs, ... }:

{
  imports = [
    ../../home-manager/programs/fish.nix
    ../../home-manager/programs/tmux.nix
    ../../home-manager/programs/git.nix
    ./dotfiles.nix
  ];

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
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "darteil";
    homeDirectory = "/home/darteil";
    stateVersion = "25.11";

    pointerCursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Adw";
      size = 20;
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
    showtime
    papers
    loupe

    gnomeExtensions.arcmenu
    gnomeExtensions.open-bar
    gnomeExtensions.status-area-horizontal-spacing
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
  ];

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Simp1e-Adw";
      package = pkgs.simp1e-cursors;
      size = 20;
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
