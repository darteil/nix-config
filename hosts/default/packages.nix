{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
      ast-grep
      gcc16
      gnumake
      wezterm
      docker-compose

      unstable.eza
      unstable.foot
      unstable.lazydocker
      unstable.tree-sitter
    ];
  };
}
