{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, NixOS-WSL, vscode-server, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nixConfigsPath = "nix-config"; # Path to the directory with nix settings relative to the home directory
    in
    {
      overlays = import ./overlays {
        inherit inputs;
      };

      nixosConfigurations = {
        vm = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system outputs; };
          modules = [
            ./hosts/virtual-machine/configuration.nix
          ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs system outputs; };
          modules = [
            NixOS-WSL.nixosModules.wsl
            vscode-server.nixosModules.default
            ./hosts/wsl/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        vm = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs nixConfigsPath; };
          modules = [
            ./hosts/virtual-machine/home.nix
          ];
        };
        wsl = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs nixConfigsPath; };
          modules = [
            ./hosts/wsl/home.nix
          ];
        };
      };
    };
}
