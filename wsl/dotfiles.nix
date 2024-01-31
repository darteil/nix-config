{ config, ... }:

let
  nixConfigPath = "nix-config";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  home = {
    file = {
      ".config/nvim".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/nvim";
      ".config/bat".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/bat";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/vifm/vifmrc";
      ".vifm/colors".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/vifm/colors";
      ".config/zellij".source = mkOutOfStoreSymlink "${config.home.homeDirectory}/${nixConfigPath}/home/dotfiles/zellij";
    };
  };
}
