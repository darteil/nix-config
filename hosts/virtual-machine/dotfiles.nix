{ config, inputs, nixConfigsPath, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  nixConfigsAbsolutePath = "${config.home.homeDirectory}/${nixConfigsPath}";
in
{
  home = {
    file = {
      ".config/foot".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/foot";
      ".config/sway".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/sway";
      ".config/waybar".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/waybar";
      ".config/fuzzel".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/fuzzel";
      ".config/nvim".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/nvim";
      ".config/bat".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/bat";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/vifm/vifmrc";
      ".vifm/colors".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/vifm/colors";
    };
  };
}
