{ config, lib, pkgs, outputs, username, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = username;
  wsl.nativeSystemd = true;

  time = {
    timeZone = "Asia/Tomsk";
    hardwareClockInLocalTime = true;
  };

  nixpkgs = {
    overlays = [
      # When applied, the unstable nixpkgs set 
      #
      # Example:
      # pkgs.unstable.bottom
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users."${username}" = {
    isNormalUser = true;
    description = "";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  programs.fish = {
    enable = true;
  };

  programs.nix-ld.enable = true;
  services.vscode-server.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
    authorizedKeysFiles = [
      "~/.ssh/github_key"
    ];
  };

  programs.ssh.startAgent = true;

  environment.shells = with pkgs; [ fish ];
  environment.systemPackages = import ./packages.nix pkgs;

  system.stateVersion = "23.11";
}
