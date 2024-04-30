{ config, pkgs, outputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./audio.nix
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
  services.udisks2.enable = true;

  services.xserver = {
    enable = true;
    displayManager = {
      startx = {
        enable = true;
      };
    };
    windowManager = {
      bspwm = {
        enable = true;
      };
    };
    layout = "us, ru";
    xkbVariant = "";
    xkbOptions = "ctrl:swapcaps,grp:alt_shift_toggle";
  };

  nixpkgs = {
    overlays = [
      # When applied, the unstable nixpkgs set 
      #
      # Example:
      # pkgs.unstable.bottom
      outputs.overlays.unstable-packages

      outputs.overlays.polybar
      outputs.overlays.bspwm-latest
    ];
    config = {
      allowUnfree = true;
    };
  };

  fonts = {
    packages = with pkgs; [
      roboto
      roboto-mono
      source-code-pro
      corefonts
      (unstable.nerdfonts.override { fonts = [ "Ubuntu" "UbuntuMono" ]; })
    ];
  };

  users.users.darteil = {
    isNormalUser = true;
    description = "darteil";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = import ./packages/user.nix pkgs;
    shell = pkgs.fish;
  };

  programs.dconf = {
    enable = true;
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
  environment.systemPackages = import ./packages/system.nix pkgs;

  system.stateVersion = "23.05";
}
