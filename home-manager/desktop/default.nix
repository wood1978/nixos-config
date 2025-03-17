{ config, pkgs, ... }:

{
  imports =
    [
      ./virtualisation.libvirtd.nix
      ./services.picom.nix
      ./plank.nix
    ];
}
