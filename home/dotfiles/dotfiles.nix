{ config, ... }:

let
  nixConfigPath = "nix-config";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  home = {
    file = {
      ".config/nvim".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/nvim";
      ".config/bspwm".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/bspwm";
      ".config/polybar".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/polybar";
      ".config/rofi".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/rofi";
      ".config/bat".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/bat";
      ".config/dunst".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/dunst";
      ".config/kitty".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/kitty";
      ".config/sxhkd".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/sxhkd";
      ".config/zellij".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/zellij";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/vifm/vifmrc";
      ".vifm/colors".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/vifm/colors";
      ".xinitrc".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/xinitrc";
      "desktop-wallpaper-1.png".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/assets/desktop-wallpaper-1.png";
      "desktop-wallpaper-2.png".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/assets/desktop-wallpaper-2.png";
    };
  };
}
