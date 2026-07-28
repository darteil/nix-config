{ ... }:
let
  zapretListGeneral = import ./zapret-whitelist.nix;
in
{
  services.proxy-suite = {
    enable = true;

    zapret = {
      enable = true;
      configName = "general(ALT)";
      listGeneral = zapretListGeneral;
      perApp.enable = false;
    };

    tray = {
      enable = false;
    };

    tgWsProxy = {
      enable = true;
      port = 1443;
      secret = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    };
  };
}
