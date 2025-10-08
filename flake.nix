{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		# home-manager, used for managing user configuration
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			# The `follows` keyword in inputs is used for inheritance.
			# Here, `inputs.nixpkgs` of home-manager is kept consistent with
			# the `inputs.nixpkgs` of the current flake,
			# to avoid problems caused by different versions of nixpkgs.
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixos-hardware.url = "github:NixOS/nixos-hardware/master";
		nixvim = {
			url = "github:nix-community/nixvim/nixos-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stm32cubeide.url = "git+https://git.sr.ht/~shelvacu/stm32cubeide-nix";
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs : let
		systems = {
			t490 = {
				extraImports = [
					inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t490
				];
			};
			t440p = {
				extraImports = [
					inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t440p
				];
			};
		};
		pkgs = import inputs.nixpkgs {
			overlays = [ inputs.stm32cubeide.overlays.default ];
		};
	in {
		nixosConfigurations = {
			t490 = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/physical/t490
					./home-manager/desktop
					./users/wood.nix
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.backupFileExtension = "backup";
						home-manager.users.wood = import ./home-manager/hm-wood.nix;
						home-manager.extraSpecialArgs = {
							inherit inputs;
						};
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
						home-manager.extraSpecialArgs = {
							inherit inputs;
						};
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
						home-manager.extraSpecialArgs = {
							inherit inputs;
						};
					}
				];
			};
			t440p = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/physical/t440p
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
						home-manager.extraSpecialArgs = {
							inherit inputs;
						};
					}
				];
			};
		};
	};
}
