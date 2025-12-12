{ config, lib, pkgs, outputs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "darteil";
  wsl.useWindowsDriver = true;
  wsl.interop.includePath = false;

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

  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  users.users."darteil" = {
    isNormalUser = true;
    description = "";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };

  fonts = {
    packages = with pkgs; [
      jetbrains-mono
    ];
  };

  programs.fish = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
    # authorizedKeysFiles = [
    #   "~/.ssh/github_key"
    # ];
  };

  programs.ssh.startAgent = true;

  environment.shells = with pkgs; [ fish ];
  environment.systemPackages = import ./packages.nix pkgs;

  system.stateVersion = "23.11";
}
