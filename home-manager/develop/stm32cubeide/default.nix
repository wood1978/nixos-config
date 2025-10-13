{ inputs, config, pkgs, ... } : {
	imports = [
	];

	home.packages = with pkgs; [
		gsettings-desktop-schemas
		adwaita-icon-theme
		stm32cubemx
		stlink-gui
		(writeShellScriptBin "stm32cubeide.sh" ''
			WORK_DIR="~/SourceCode/STM32CubeIDE"
			mkdir -p "$WORK_DIR"
			cd "$WORK_DIR"
			nix run git+https://git.sr.ht/~shelvacu/stm32cubeide-nix
		 '')
	];
}
