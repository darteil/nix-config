{ config, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  home = {
    file = {
      ".config/foot".source = mkOutOfStoreSymlink "${config.var.nixConfigPath}/dotfiles/foot";
      ".config/nvim".source = mkOutOfStoreSymlink "${config.var.nixConfigPath}/dotfiles/nvim";
      ".config/nvim-minimal".source = mkOutOfStoreSymlink "${config.var.nixConfigPath}/dotfiles/nvim-minimal";
      ".config/bat".source = mkOutOfStoreSymlink "${config.var.nixConfigPath}/dotfiles/bat";
      ".config/wezterm".source = mkOutOfStoreSymlink "${config.var.nixConfigPath}/dotfiles/wezterm";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${config.var.nixConfigPath}/dotfiles/vifm/vifmrc";
      ".config/tig".source = mkOutOfStoreSymlink "${config.var.nixConfigPath}/dotfiles/tig";
    };
  };
}
