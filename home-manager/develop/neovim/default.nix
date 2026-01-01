{ inputs, config, pkgs, ... } : {
	imports = [
		inputs.nixvim.homeModules.nixvim
		./autocommands.nix
		./completion.nix
		./keymappings.nix
		./options.nix
		./plugins
		./todo.nix
	];

	home.shellAliases.v = "nvim";

	home.packages = with pkgs; [
		ctags
		cscope
	];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;

		#nixpkgs.useGlobalPackages = false;

		performance = {
			combinePlugins = {
				enable = true;
				standalonePlugins = [
					"hmts.nvim"
					"neorg"
					"nvim-treesitter"
				];
			};
			byteCompileLua.enable = true;
		};

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		luaLoader.enable = true;
	};
}
