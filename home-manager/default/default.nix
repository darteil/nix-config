{ pkgs, outputs, config, ... }:

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
    ./fish.nix
    ./git.nix
    ./programs.nix
    ./dotfiles.nix
  ];

  home = {
    username = config.var.username;
    homeDirectory = "/home/${config.var.username}";
    stateVersion = "26.05";

    pointerCursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Adw";
      size = 22;
    };

    # sessionVariables = {
    #   EDITOR = "nvim";
    # };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Simp1e-Adw";
      package = pkgs.simp1e-cursors;
      size = 22;
    };
  };

  programs.home-manager.enable = true;
}
