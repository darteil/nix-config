{ config, pkgs, outputs, username, ... }:

{
  imports = [
    ../home/apps/fish.nix
    ../home/apps/tmux.nix
    ../home/apps/git.nix
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
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.fzf = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
