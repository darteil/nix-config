{ config, inputs, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  home = {
    file = {
      ".config/nvim".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/nvim";
      ".config/bspwm".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/bspwm";
      ".config/polybar".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/polybar";
      ".config/rofi".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/rofi";
      ".config/bat".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/bat";
      ".config/dunst".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/dunst";
      ".config/kitty".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/kitty";
      ".config/sxhkd".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/sxhkd";
      ".config/wezterm".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/wezterm";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/vifm/vifmrc";
      ".vifm/colors".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/vifm/colors";
      ".xinitrc".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/xinitrc";
      "desktop-wallpaper-1.png".source = mkOutOfStoreSymlink "${inputs.self}/home-manager/wallpapers/desktop-wallpaper-1.png";
    };
  };
}
