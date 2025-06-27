{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
    vifm
    htop
    home-manager
    killall
    pkgs.unstable.tray-tui
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
      calc

      firefox
      google-chrome
      gcc9
      gnumake
      fuzzel
      rofi-wayland
      waybar

      # Development
      tree-sitter
      nixpkgs-fmt
      nodePackages.bash-language-server
      lua-language-server
      stylua

      pkgs.unstable.eza
      pkgs.unstable.foot
      pkgs.unstable.neovim
    ];
  };
}
