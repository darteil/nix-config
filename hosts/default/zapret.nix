{ ... }:
let
  list = import ./zapret-whitelist.nix;
in
{
  services.zapret = {
    enable = true;
    whitelist = list.whitelist;
    params = [
      "--dpi-desync=fake,disorder2"
      "--dpi-desync-ttl=1"
      "--dpi-desync-autottl=2"
    ];
  };
}
