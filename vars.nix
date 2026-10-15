{ inputs, lib, config, pkgs, ... }:
{
  options.var = with lib.types; {
    username = lib.mkOption { type = str; };
    nixConfigPath = lib.mkOption { type = str; };
  };
  config.var = {
    username = "darteil";
    nixConfigPath = "/home/darteil/nix-config";
  };
}
