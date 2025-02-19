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

  # Development
  nodejs_23
  nodejs_23.pkgs.pnpm
  pm2
  prettierd
  typescript
  nixpkgs-fmt
  vscode-langservers-extracted
  nodePackages.bash-language-server
  pkgs.unstable.nodePackages.typescript-language-server
  lua-language-server
  stylua
  pkgs.unstable.lazydocker
  docker-compose
]
