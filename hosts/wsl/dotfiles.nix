{ config, inputs, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  home = {
    file = {
      ".config/nvim".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/nvim";
      ".config/bat".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/bat";
      ".vifm/vifmrc".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/vifm/vifmrc";
      ".vifm/colors".source = mkOutOfStoreSymlink "${inputs.self}/dotfiles/vifm/colors";
    };
  };
}
