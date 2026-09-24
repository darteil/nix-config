{ ... }:
let
  zapretListGeneral = import ./zapret-whitelist.nix;
in
{
  services.proxy-suite = {
    enable = true;

    sshProxy = {
      enable = false;
    };

    perAppRouting = {
      enable = true;
      zapret = {
        enable = true;
      };
    };

    zapret = {
      enable = true;
      zapret-discord-youtube = {
        configName = "general(ALT)";
        domains = zapretListGeneral;
      };
    };

    gui = {
      enable = false;
    };

    tgWsProxy = {
      enable = true;
      listener = {
        port = 1443;
      };
      secret = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    };
  };
}
