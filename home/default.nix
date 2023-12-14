{ config, pkgs, outputs, ... }:

let
  username = "darteil";
  userDirectory = "/home/${username}";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  imports = [
    ./apps/fish.nix
    ./apps/git.nix
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
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    pointerCursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Adw";
      size = 20;
    };

    file = {
      ".config/nvim".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/nvim";
      ".vifm".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/vifm";
      ".config/bspwm".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/bspwm";
      ".config/polybar".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/polybar";
      ".config/rofi".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/rofi";
      ".config/bat".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/bat";
      ".config/dunst".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/dunst";
      ".config/kitty".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/kitty";
      ".config/sxhkd".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/sxhkd";
      ".config/zellij".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/zellij";
      ".config/btop".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/btop";
      ".xinitrc".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/xinitrc";
      "desktop-wallpaper-1.png".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/assets/desktop-wallpaper-1.png";
      "desktop-wallpaper-2.png".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/assets/desktop-wallpaper-2.png";
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  gtk = {
    enable = true;
    font = {
      package = pkgs.ubuntu_font_family;
      name = "Ubuntu";
      size = 10;
    };
    theme = {
      package = pkgs.yaru-theme;
      name = "Yaru";
    };
    iconTheme = {
      package = pkgs.yaru-theme;
      name = "Yaru";
    };
    cursorTheme = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Adw";
      size = 20;
    };
  };

  programs.fzf = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
