{ config, pkgs, ... } : {
  home.username = "wood";
  home.homeDirectory = "/home/wood";

  imports = [
    ./hm-wood_common.nix
    ./desktop/prismlauncher.nix
  ];

  programs.git = {
    userName = "Wood Chan";
    userEmail = "ShihHsien.Chan@gmail.com";
  };
}
