{ pkgs, ... } : {
	home.username = "woodzhan";
	home.homeDirectory = "/home/woodzhan";

	imports = [
		./hm-wood_common.nix
	];

	home.packages = with pkgs; [
		barrier
	];

	programs.git = {
		userName = "Wood Zhan";
		userEmail = "woodzhan@truelight.com.tw";
	};
}
