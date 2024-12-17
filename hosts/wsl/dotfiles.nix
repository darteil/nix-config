{ config, inputs, nixConfigsPath, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  nixConfigsAbsolutePath = "${config.home.homeDirectory}/${nixConfigsPath}";
in
{
  home = {
    file = {
      ".config/nvim".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/nvim";
      ".config/nvim-light".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/nvim-light";
      ".config/bat".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/bat";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/vifm/vifmrc";
      ".vifm/colors".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/vifm/colors";
    };
  };
}
