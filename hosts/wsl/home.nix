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
    stateVersion = "23.11";
    sessionVariables = {
      EDITOR = "nvim";
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
