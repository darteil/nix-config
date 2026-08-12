{ inputs, ... }: {
  unstable-packages = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
  chrome-wayland = final: prev: {
    google-chrome = prev.google-chrome.override {
      commandLineArgs =
        "--ozone-platform='wayland'";
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
  gnomeExtensions = final: prev: {
    gnomeExtensions = prev.gnomeExtensions // {
      arcmenu = prev.gnomeExtensions.arcmenu.overrideAttrs (oldAttrs: rec {
        version = "69.2";
        src = final.fetchFromGitLab {
          owner = "arcmenu";
          repo = "ArcMenu";
          rev = "v${version}";
          sha256 = "sha256-BdvFeoXwGxFlBH1JqcSDAKMzN+wBEmZdsz+gXWxQF6Y=";
        };
        uuid = "arcmenu@arcmenu.com";
      });
    };
  };
}
