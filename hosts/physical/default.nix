{ pkgs, ... } : {
	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	boot.kernel.sysctl = { "vm.swappiness" = 20; };

	# Enable networking
	networking.networkmanager = {
		enable = true;
		plugins = with pkgs; [
      		networkmanager-openvpn
    	];
	};


	# Enable network manager applet
	programs.nm-applet.enable = true;

	# Set your time zone.
	time.timeZone = "Asia/Taipei";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	i18n.inputMethod = {
		enable = true;
		type = "fcitx5";
		fcitx5.addons = with pkgs; [
			fcitx5-chewing
			fcitx5-table-extra
			qt6Packages.fcitx5-configtool
			qt6Packages.fcitx5-chinese-addons
		];
	};

	fonts.packages = with pkgs; [
		source-code-pro
		wqy_zenhei
		wqy_microhei
	];

	# Enable the X11 windowing system.
	services.xserver.enable = true;

	# Enable the LXQT Desktop Environment.
	services.xserver.displayManager.lightdm.enable = true;
	services.xserver.desktopManager.lxqt.enable = true;

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	services.xscreensaver.enable = true;
	security.pam.services.xscreensaver.enable = true;

	# Enable BAMF for better application launching and switching.
	services.bamf.enable = true;

	# Enable CUPS to print documents.
	services.printing.enable = true;

	# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		#jack.enable = true;

		# use the example session manager (no others are packaged yet so this is enabled by default,
		# no need to redefine it in your config for now)
		#media-session.enable = true;
	};

	# Enable touchpad support (enabled default in most desktopManager).
	# services.xserver.libinput.enable = true;

	# Enable OpenGL
	hardware.graphics = {
		enable = true;
	};

	users.groups.plugdev = {};

	# Install firefox.
	programs.firefox.enable = true;

	# Install neovim
	#programs.neovim = {
	#	enable = true;
	#	defaultEditor = true;
	#};

	nixpkgs.config = {
		# Allow unfree packages
		allowUnfree = true;

		permittedInsecurePackages = [
        	"qtwebengine-5.15.19"
			"libsoup-2.74.3"
    	];

		allowBroken = true;

		firefox = {
			enableGoogleTalkPlugin = true;
			enableAdobeFlash = true;
		};
	};

	# Enable flakes and depend's nix-command
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
	#	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	#	wget
		rar
	  	git
		cockpit
		netbird-ui
	];

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#	 enable = true;
	#	 enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	#services.openssh.enable = true;

	# Open ports in the firewall.
	networking.firewall.allowedTCPPorts = [ 22022 ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# cockpit service config
	services.cockpit = {
		enable = true;
		port = 9090;
		openFirewall = true; # Please see the comments section
		settings = {
			WebService = {
				AllowUnencrypted = true;
			};
		};
	};

	services.netbird.enable = true; # for netbird service & CLI

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.11"; # Did you read the comment?

	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
	};
}
