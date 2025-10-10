{ inputs, config, pkgs, ... } : {
	imports = [
	];

	home.packages = with pkgs; [
		gsettings-desktop-schemas
		adwaita-icon-theme
		stm32cubemx
	];
}
