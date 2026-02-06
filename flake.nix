{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url          = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = { 
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
     };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager,  nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        system = system;

        specialArgs = { inherit inputs; };

        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true; 
            home-manager.sharedModules = [
              plasma-manager.homeManagerModules.plasma-manager
            ];
          home-manager.users = {
            przemyslaw = import ./home.nix;
          };
          }
          {
            nixpkgs.overlays = [
              (final: prev: {
                unstable = import inputs.nixpkgs-unstable {
                  inherit system;
                  config = prev.config;
                };
              })
            ];
          }

        ];
      };
    };
  }  
