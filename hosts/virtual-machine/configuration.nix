{ config, pkgs, outputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
  ];

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  virtualisation.vmware.guest.enable = true;

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

  services.getty.autologinUser = "darteil";

  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        enable = true;
      };
    };

    windowManager = {
      openbox = {
        enable = true;
      };
    };
    xkb = {
      layout = "us, ru";
      variant = "";
      options = "ctrl:swapcaps,grp:alt_shift_toggle";
    };
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

  fonts = {
    packages = with pkgs; [
      jetbrains-mono
    ];
  };

  users.users."darteil" = {
    isNormalUser = true;
    description = "";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.fish;
  };

  programs.fish = {
    enable = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };

  environment.shells = with pkgs; [ fish ];
  system.stateVersion = "24.05";
}
