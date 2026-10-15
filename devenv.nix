{ pkgs, ... }:

{
  packages = [
    pkgs.nixpkgs-fmt
    pkgs.bash-language-server
    pkgs.stylua
  ];

  languages = {
    lua = {
      enable = true;
      lsp.enable = true;
    };
    nix = {
      enable = true;
      lsp.enable = true;
    };
  };
}
