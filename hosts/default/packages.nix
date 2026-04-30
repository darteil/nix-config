{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gitFull
    curl
    wget
    vim
    vifm
    tree
    htop
    home-manager
    killall
    wl-clipboard
  ];

  users.users."darteil" = {
    packages = with pkgs; [
      btop
      tealdeer
      delta
      fd
      dua
      bat
      jq
      ripgrep
      gcc15
      gnumake
      tig

      vscode
      obs-studio
      zoom-us
      krita
      figma-linux
      firefox
      vivaldi
      google-chrome
      keepassxc
      thunderbird
      sublime3
      hydrapaper
      qbittorrent
      wezterm

      # Development
      nodejs_24
      nodejs_24.pkgs.pnpm
      prettierd
      typescript
      vscode-langservers-extracted
      docker-compose
      nixpkgs-fmt
      bash-language-server
      lua-language-server
      stylua
      nixd
      cargo
      rustc
      ast-grep

      pkgs.unstable.eza
      pkgs.unstable.foot
      pkgs.unstable.typescript-language-server
      pkgs.unstable.lazydocker
      pkgs.unstable.neovim
      pkgs.unstable.telegram-desktop
      pkgs.unstable.tree-sitter
    ];
  };
}
