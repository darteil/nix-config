{ inputs, ... }: {
  unstable-packages = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  polybar = final: prev: {
    polybar = prev.polybar.override { pulseSupport = true; };
  };
}
