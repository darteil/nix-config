{ ... }:
let
  zapretListGeneral = import ./zapret-whitelist.nix;
in
{
  services.zapret-discord-youtube = {
    enable = true;
    configName = "general(ALT)";
    listGeneral = zapretListGeneral;
  };
}
