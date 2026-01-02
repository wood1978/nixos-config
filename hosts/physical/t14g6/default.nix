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

	networking.hostName = "t14g6"; # Define your hostname.
	# networking.wireless.enable = true;	# Enables wireless support via wpa_supplicant.

	networking.extraHosts = ''
		192.168.0.22	homeassistant.locale
	'';

	hardware.graphics = {
        	extraPackages = with pkgs; [
      			# your Open GL, Vulkan and VAAPI drivers
      			vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
      			# onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
      			# intel-media-sdk   # for older GPUs
    		];
  	};

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	hardware.bluetooth.enable = true; # enables support for Bluetooth
	hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

	# List services that you want to enable:
	# Enable bluetooth service
	services.blueman.enable = true;
}
