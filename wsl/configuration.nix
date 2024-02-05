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

  environment.shells = with pkgs; [ fish ];
  environment.systemPackages = import ./packages.nix pkgs;

  system.stateVersion = "23.11";
}
