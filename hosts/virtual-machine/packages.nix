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

      neovim
      # google-chrome
      firefox
      gcc9
      tree-sitter
      fuzzel
      waybar
      hyprpaper
      hyprpicker

      # Development
      nixpkgs-fmt
      nodePackages.bash-language-server
      lua-language-server
      stylua

      pkgs.unstable.eza
      pkgs.unstable.foot
    ];
  };
}
