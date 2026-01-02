{ pkgs, ... } : {
	home.username = "woodzhan";
	home.homeDirectory = "/home/woodzhan";

	imports = [
		./hm-wood_common.nix
	];

	home.packages = with pkgs; [
		#barrier
	];

	programs.git.settings.user = {
		name = "Wood Zhan";
		email = "woodzhan@truelight.com.tw";
	};
}
