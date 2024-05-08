pkgs: with pkgs; [
  vim
  gitFull
  vifm
  curl
  wget
  htop
  killall
  btop
  tealdeer
  delta
  fd
  dua
  bat
  ripgrep
  neovim
  gcc9
  home-manager
  tree-sitter
  pkgs.unstable.eza

  # Development
  nodejs_21
  nodejs_21.pkgs.pnpm
  prettierd
  typescript
  nixpkgs-fmt
  vscode-langservers-extracted
  nodePackages.bash-language-server
  pkgs.unstable.nodePackages.typescript-language-server
  lua-language-server
  stylua
]
