{ config, inputs, ... }:

let
  vars = import ./variables.nix;

  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  home = {
    file = {
      ".config/foot".source = mkOutOfStoreSymlink "${vars.nixConfigPath}/dotfiles/foot";
      ".config/nvim".source = mkOutOfStoreSymlink "${vars.nixConfigPath}/dotfiles/nvim";
      ".config/bat".source = mkOutOfStoreSymlink "${vars.nixConfigPath}/dotfiles/bat";
      ".config/wezterm".source = mkOutOfStoreSymlink "${vars.nixConfigPath}/dotfiles/wezterm";
      ".config/alacritty".source = mkOutOfStoreSymlink "${vars.nixConfigPath}/dotfiles/alacritty";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${vars.nixConfigPath}/dotfiles/vifm/vifmrc";
    };
  };
}
