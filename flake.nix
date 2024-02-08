{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
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
      username = "darteil";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system outputs; };
          modules = [
            ./system/configuration.nix
          ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs system outputs username; };
          modules = [
            NixOS-WSL.nixosModules.wsl
            vscode-server.nixosModules.default
            ./wsl/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        default = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home
          ];
        };
        wsl = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs username; };
          modules = [
            ./wsl/home.nix
          ];
        };
      };
    };
}
