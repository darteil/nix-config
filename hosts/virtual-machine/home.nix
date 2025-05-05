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
    stateVersion = "24.05";

    pointerCursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Adw";
      size = 20;
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Qogir";
      package = pkgs.qogir-icon-theme;
    };

    theme = {
      name = "Qogir-Light";
      package = pkgs.qogir-theme;
    };

    cursorTheme = {
      name = "Simp1e-Adw";
      package = pkgs.simp1e-cursors;
      size = 20;
    };
  };

  programs.fzf = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
