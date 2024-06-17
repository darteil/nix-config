{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
    vifm
    htop
    arandr
    home-manager
    killall
  ];

  users.users."darteil" = {
    packages = with pkgs; [
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
      obconf
      rofi
      pcmanfm
      gcc9
      tree-sitter

      # Development
      nixpkgs-fmt
      vscode-langservers-extracted
      nodePackages.bash-language-server
      lua-language-server
      stylua

      pkgs.unstable.alacritty
      pkgs.unstable.rxvt-unicode-unwrapped-emoji
      pkgs.unstable.eza
    ];
  };
}
