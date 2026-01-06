{ config, inputs, ... }:

let
  vars = import ./variables.nix;

  inherit (config.lib.file) mkOutOfStoreSymlink;
  nixConfigsAbsolutePath = "${config.home.homeDirectory}/${vars.nixConfigPath}";
in
{
  home = {
    file = {
      ".config/foot".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/foot";
      ".config/nvim".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/nvim";
      ".config/bat".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/bat";
      ".config/wezterm".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/wezterm";
      ".config/alacritty".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/alacritty";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${nixConfigsAbsolutePath}/dotfiles/vifm/vifmrc";
    };
  };
}
