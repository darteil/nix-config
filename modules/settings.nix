{ lib, ... }:
with lib;

{
  options.settingsModule = {
    username = mkOption {
      type = types.str;
      default = "darteil";
      description = "";
    };
    nixConfigPath = mkOption {
      type = types.str;
      default = "nix-config";
      description = "Path to the directory with nix settings relative to the home directory";
    };
  };
}
