{ pkgs, ... } : {
	imports = [
		./49-stlinkv1.rules.nix
		./49-stlinkv2.rules.nix
		./49-stlinkv2-1.rules.nix
		./49-stlinkv3.rules.nix
	];
}
