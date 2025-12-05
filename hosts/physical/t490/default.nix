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

	networking.hostName = "t490"; # Define your hostname.
	# networking.wireless.enable = true;	# Enables wireless support via wpa_supplicant.

	networking.extraHosts = ''
		192.168.0.22	homeassistant.locale
	'';

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	hardware.bluetooth.enable = true; # enables support for Bluetooth
	hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

	# Load nvidia driver for Xorg and Wayland
	services.xserver.videoDrivers = ["nvidia"];

	hardware.nvidia = {
		# Modesetting is required.
		modesetting.enable = true;

		# Nvidia power management. Experimental, and can cause sleep/suspend to fail.
		# Enable this if you have graphical corruption issues or application crashes after waking
		# up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
		# of just the bare essentials.
		powerManagement.enable = false;

		# Fine-grained power management. Turns off GPU when not in use.
		# Experimental and only works on modern Nvidia GPUs (Turing or newer).
		powerManagement.finegrained = false;

		# Use the NVidia open source kernel module (not to be confused with the
		# independent third-party "nouveau" open source driver).
		# Support is limited to the Turing and later architectures. Full list of
		# supported GPUs is at:
		# https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
		# Only available from driver 515.43.04+
		open = false;

		# Enable the Nvidia settings menu,
				# accessible via `nvidia-settings`.
		nvidiaSettings = true;

		# Optionally, you may need to select the appropriate driver version for your specific GPU.
		package = config.boot.kernelPackages.nvidiaPackages.stable;

		prime = {
			sync.enable = true;
			# Make sure to use the correct Bus ID values for your system!
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:45:0:0";
		};
	};

	# List services that you want to enable:
	# Enable bluetooth service
	services.blueman.enable = true;

	services.netbird.enable = true; # for netbird service & CLI
	environment.systemPackages = [ pkgs.netbird-ui ]; # for GUI
}
