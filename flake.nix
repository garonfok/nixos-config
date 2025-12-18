{
  description = "My Replicable Quickshell OS";

  inputs = {
    # The main package repository
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };

  };

  outputs = { nixpkgs, ... }@inputs:
    let
      inherit (nixpkgs) lib;
      specialArgs = { inherit inputs;};
      forAllSystems =
        body: lib.getAttrs lib.systems.flakeExposed ( system: body nixpkgs.legacyPackages.${system});
    in {
      nixosConfigurations = {
        riley = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./common
            ./hosts/riley
            inputs.home-manager.nixosModules.home-manager
            ./home
          ];
	      };
        riley-p1 = nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            ./common
            ./hosts/riley-p1
            inputs.home-manager.nixosModules.home-manager
            ./home
          ];
        };
      };
    };
}
