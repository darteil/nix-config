{ config, pkgs, outputs, inputs, username, ... }:

{
  imports = [
    "${inputs.self}/home-manager/programs/fish.nix"
    "${inputs.self}/home-manager/programs/tmux.nix"
    "${inputs.self}/home-manager/programs/git.nix"
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
    #font = {
    #  package = pkgs.ubuntu_font_family;
    #  name = "Ubuntu";
    #  size = 10;
    #};
    #theme = {
    #  package = pkgs.plano-theme;
    #  name = "Plano-dark-titlebar";
    #};
  };

  programs.fzf = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
