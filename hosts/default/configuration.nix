{ config, pkgs, outputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./packages.nix
    ./zapret.nix
  ];

  hardware = {
    graphics = {
      enable = true;
    };
  };

  services.xserver.enable = false;
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;

  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  nixpkgs = {
    overlays = [
      # When applied, the unstable nixpkgs set 
      #
      # Example:
      # pkgs.unstable.bottom
      outputs.overlays.unstable-packages
      outputs.overlays.chrome-wayland
    ];
    config = {
      allowUnfree = true;
    };
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
    hostName = "darteil-pc";
    networkmanager = {
      enable = true;
    };
  };

  time = {
    timeZone = "Asia/Tomsk";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };


  fonts = {
    packages = with pkgs; [
      ubuntu-classic
      nerd-fonts.ubuntu-mono
    ];
  };

  users.users."darteil" = {
    isNormalUser = true;
    description = "Romanov Yuri";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.fish;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.throne = {
    enable = true;
    tunMode = {
      enable = true;
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };

  environment.shells = with pkgs; [ fish ];
  system.stateVersion = "25.11";
}
