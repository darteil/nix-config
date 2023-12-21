{ config, ... }:

let
  userDirectory = "/home/darteil";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  home = {
    file = {
      ".config/nvim".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/nvim";
      ".config/bspwm".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/bspwm";
      ".config/polybar".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/polybar";
      ".config/rofi".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/rofi";
      ".config/bat".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/bat";
      ".config/dunst".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/dunst";
      ".config/kitty".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/kitty";
      ".config/sxhkd".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/sxhkd";
      ".config/zellij".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/zellij";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/vifm/vifmrc";
      ".vifm/colors".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/vifm/colors";
      ".xinitrc".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/home/dotfiles/xinitrc";
      "desktop-wallpaper-1.png".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/assets/desktop-wallpaper-1.png";
      "desktop-wallpaper-2.png".source = mkOutOfStoreSymlink "${userDirectory}/nix-config/assets/desktop-wallpaper-2.png";
    };
  };
}
