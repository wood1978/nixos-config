{ inputs, ... } : {
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		./autocommands.nix
		./completion.nix
		./keymappings.nix
		./options.nix
		./plugins
		./todo.nix
	];

	home.shellAliases.v = "nvim";

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
