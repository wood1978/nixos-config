{ config, pkgs, ... } : {
	# home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

	# home.file.".config/i3/scripts" = {
	#	 source = ./scripts;
	#	 recursive = true;	 # 递归整个文件夹
	#	 executable = true;	# 将其中所有文件添加「执行」权限
	# };

	# home.file.".xxx".text = ''
	#	xxx
	# '';

	xresources.properties = {
		"Xcursor.size" = 48;
		"Xft.dpi" = 96;
	};

	home.packages = with pkgs; [
		#neofetch
		#nnn # terminal file manager
		#screen
		terminator
		notepadqq
		qalculate-qt
		keepass
		google-chrome
		libreoffice-qt

		# 3D printer
		prusa-slicer

		# Multimedia
		vdhcoapp
		mpv
		smplayer
		shotcut
		kdePackages.kdenlive

		# graphics
		drawio
		freecad

		# EDA-tools
		#kicad

		# develop
		meld
		vscode
		arduino-ide

		# archives
		zip
		xz
		unzip
		p7zip

		# utils
		#ripgrep # recursively searches directories for a regex pattern
		#jq # A lightweight and flexible command-line JSON processor
		#yq-go # yaml processor https://github.com/mikefarah/yq
		#eza # A modern replacement for ‘ls’
		#fzf # A command-line fuzzy finder

		# networking tools
		#mtr # A network diagnostic tool
		#iperf3
		#dnsutils	# `dig` + `nslookup`
		#ldns # replacement of `dig`, it provide the command `drill`
		#aria2 # A lightweight multi-protocol & multi-source command-line download utility
		#socat # replacement of openbsd-netcat
		#nmap # A utility for network discovery and security auditing
		#ipcalc	# it is a calculator for the IPv4/v6 addresses

		# misc
		file
		which
		tree
		gnused
		gnutar
		gawk
		zstd
		gnupg

		# nix related
		#
		# it provides the command `nom` works just like `nix`
		# with more details log output
		#nix-output-monitor

		# productivity
		#hugo # static site generator
		#glow # markdown previewer in terminal

		btop	# replacement of htop/nmon
		#iotop # io monitoring
		#iftop # network monitoring

		# system call monitoring
		#strace # system call monitoring
		#ltrace # library call monitoring
		#lsof # list open files

		# system tools
		#sysstat
		#lm_sensors # for `sensors` command
		#ethtool
		#pciutils # lspci
		#usbutils # lsusb
	];

	programs.git = {
		enable = true;
		aliases = {
			s = "status";
			co = "checkout";
			cob = "checkout -b";
			del = "branch -D";
			br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
			save = "!git add -A && git commit -m 'chore: commit save point";
			undo = "reset HEAD~1 --mixed";
			res = "!git reset --hard";
			done = "!git push origin HEAD";
			l = "!git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
			ls = "log --graph --pretty=format:\"%h <%an> %ar %s\"";
		};
	};

	programs.bash = {
		enable = true;
		enableCompletion = true;
		#bashrcExtra = ''
		#	export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
		#'';

		#shellAliases = {
		#	k = "kubectl";
		#	urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
		#	urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
		#};
	};

	# This value determines the Home Manager release that your
	# configuration is compatible with. This helps avoid breakage
	# when a new Home Manager release introduces backwards
	# incompatible changes.
	#
	# You can update Home Manager without changing this value. See
	# the Home Manager release notes for a list of state version
	# changes in each release.
	home.stateVersion = "25.11";

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
