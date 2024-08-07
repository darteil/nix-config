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
  jq
  libxml2
  dua
  bat
  ripgrep
  gcc9
  home-manager
  tree-sitter
  pkgs.unstable.eza
  pkgs.unstable.neovim
  pkgs.unstable.zellij

  # Development
  nodejs_22
  nodejs_22.pkgs.pnpm
  prettierd
  typescript
  nixpkgs-fmt
  vscode-langservers-extracted
  nodePackages.bash-language-server
  pkgs.unstable.nodePackages.typescript-language-server
  lua-language-server
  stylua
]
