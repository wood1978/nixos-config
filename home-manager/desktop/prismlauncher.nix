{ pkgs, ... }: {
	home.packages = with pkgs; [
		prismlauncher #Minecraft launcher
		jdk
	];
}
