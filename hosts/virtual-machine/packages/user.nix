pkgs: with pkgs; [
  btop
  tealdeer
  delta
  fd
  dua
  bat
  xclip
  jq
  feh
  ripgrep
  stress

  neovim
  firefox
  chromium
  pcmanfm
  sxiv
  gcc9
  tree-sitter

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

  pkgs.unstable.alacritty
  pkgs.unstable.eza
]
