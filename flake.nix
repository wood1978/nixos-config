{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      t490 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        extraImports = [
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t490
        ];
        modules = [
	  ./hosts/physical/t490
	  ./home-manager/desktop
	  ./users/wood.nix
	  home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.backupFileExtension = "backup";

            home-manager.users.wood = import ./home-manager/hm-wood.nix;
            # home-manager.extraSpecialArgs = inputs;
          }
        ];
      };
      C1297 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/physical/C1297
	  ./home-manager/desktop
          ./users/woodzhan.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.woodzhan = import ./home-manager/hm-woodzhan.nix;
            # home-manager.extraSpecialArgs = inputs;
          }
        ];
      };
      b660mVM = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/physical/b660mVM
	  ./home-manager/desktop
          ./users/wood.nix
	  ./users/bella.nix
	  ./users/lulu.nix
	  ./users/woody.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.wood = import ./home-manager/hm-wood.nix;
            home-manager.users.bella = import ./home-manager/hm-bella.nix;
            home-manager.users.lulu = import ./home-manager/hm-lulu.nix;
            home-manager.users.woody = import ./home-manager/hm-woody.nix;
            # home-manager.extraSpecialArgs = inputs;
          }
        ];
      };
    };
  };
}
