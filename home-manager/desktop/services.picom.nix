{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		picom
	];

	# Enable picom compositor
	services.picom.enable = true;
}
