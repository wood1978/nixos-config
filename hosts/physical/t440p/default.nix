# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... } : {
	imports = [
		# hosts/physical
		../default.nix
		# Include the results of the hardware scan.
		./hardware-configuration.nix
	];

	boot.kernelParams = [ "i915.force_probe=0416" ];

	networking.hostName = "t440p"; # Define your hostname.
	# networking.wireless.enable = true;	# Enables wireless support via wpa_supplicant.

	networking.extraHosts = ''
		192.168.0.22	homeassistant.locale
	'';

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	services.tlp = {
		enable = true;
		settings = {
			CPU_SCALING_GOVERNOR_ON_AC = "performance";
			CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

			CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
			CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

			CPU_MIN_PERF_ON_AC = 0;
			CPU_MAX_PERF_ON_AC = 100;
			CPU_MIN_PERF_ON_BAT = 0;
			CPU_MAX_PERF_ON_BAT = 20;

			#Optional helps save long term battery health
			START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
			STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

		};
	};

	services.auto-cpufreq.enable = true;
	services.auto-cpufreq.settings = {
		battery = {
			governor = "powersave";
			turbo = "never";
		};
		charger = {
			governor = "performance";
			turbo = "auto";
		};
	};
	
	hardware.bluetooth.enable = true; # enables support for Bluetooth
	hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

	hardware.graphics = {
		extraPackages = with pkgs; [
			#... # your Open GL, Vulkan and VAAPI drivers
			vpl-gpu-rt # or intel-media-sdk for QSV
		];
	};

	# List services that you want to enable:
	# Enable bluetooth service
	services.blueman.enable = true;
}
