{ pkgs, outputs, config, ... }:

{
  nixpkgs = {
    overlays = [
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
    ./tmux.nix
    ./programs.nix
    ./development.nix
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

    sessionVariables = {
      # EDITOR = "nvim";
      # QT_STYLE_OVERRIDE = "Fusion";
    };
  };

  qt = {
    enable = true;
    style = {
      name = "fusion";
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Simp1e-Adw";
      package = pkgs.simp1e-cursors;
      size = 22;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      font-name = "Roboto 11";
      document-font-name = "Adwaita Sans 11";
      monospace-font-name = "Ubuntu Mono 10";
    };
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
