{ config, inputs, nixConfigsPath, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  nixConfigsAbsolutePath = "${config.home.homeDirectory}/${nixConfigsPath}";
in
{
  home = {
    file = {
      ".config/kitty".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/kitty";
      ".config/alacritty".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/alacritty";
      ".config/nvim".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/nvim";
      ".config/bat".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/bat";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/vifm/vifmrc";
      ".vifm/colors".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/vifm/colors";
      "desktop-wallpaper-1.png".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/home-manager/wallpapers/desktop-wallpaper-1.png";
    };
  };
}
