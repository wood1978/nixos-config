{ config, pkgs, ... } : {
  home.username = "woody";
  home.homeDirectory = "/home/woody";

  imports = [
    ./hm-woody_common.nix
  ];
}
