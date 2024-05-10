{ inputs, ... }: {
  unstable-packages = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  # polybar = final: prev: {
  #   polybar = prev.polybar.override { pulseSupport = true; };
  # };
  # bspwm-latest = final: prev: {
  #   bspwm = prev.bspwm.overrideAttrs (old: {
  #     src = prev.fetchFromGitHub {
  #       owner = "baskerville";
  #       repo = "bspwm";
  #       rev = "af3bd8b4351f4478fe0fe3cfd6c09e44cb108b4b";
  #       sha256 = "O4Qwdjb3p6jw8Qtcd4zGZ57cB3oCCbPZcjUQtWbyC7Y=";
  #     };
  #   });
  # };
}
