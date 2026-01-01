{ config, pkgs, ... } : {
	virtualisation.libvirtd = {
		enable = true;
		qemu = {
			package = pkgs.qemu_kvm;
			runAsRoot = true;
			swtpm.enable = true;
			#ovmf = {
			#	enable = true;
				#packages = [(pkgs.OVMF.override {
				#	secureBoot = true;
				#	tpmSupport = true;
				#}).fd];
			#};
			vhostUserPackages = [ pkgs.virtiofsd ];
		};
	};
	virtualisation.spiceUSBRedirection.enable = true;

	environment.systemPackages = with pkgs; [
		dconf
		virt-manager
	];
}
