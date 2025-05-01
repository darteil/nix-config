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

      firefox
      gcc9
      gnumake
      tree-sitter
      fuzzel
      waybar

      # Development
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
