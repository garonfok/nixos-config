{ inputs, config, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  config.nixpkgs.overlays = [
    inputs.nur.overlays.default
  ];

  config.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.garonfok = ./pkgs.nix;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
  };
}
