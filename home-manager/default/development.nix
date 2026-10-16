{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pnpm
    nodejs-slim_26
    typescript-go
    vscode-langservers-extracted
    nixpkgs-fmt
    bash-language-server
    lua-language-server
    stylua
    nixd
    cargo
    rustc
    oxlint
    oxfmt
    # unstable.typescript-language-server
  ];
}
