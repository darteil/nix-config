{ config, inputs, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  homeDirectoryPath = "/home/${config.settingsModule.username}";
  nixConfigAbsolutePath = "${homeDirectoryPath}/${config.settingsModule.nixConfigPath}";
in
{
  home = {
    file = {
      ".config/nvim".source = mkOutOfStoreSymlink "${nixConfigAbsolutePath}/dotfiles/nvim";
      ".config/bat".source = mkOutOfStoreSymlink "${nixConfigAbsolutePath}/dotfiles/bat";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${nixConfigAbsolutePath}/dotfiles/vifm/vifmrc";
      ".vifm/colors".source = mkOutOfStoreSymlink "${nixConfigAbsolutePath}/dotfiles/vifm/colors";
    };
  };
}
