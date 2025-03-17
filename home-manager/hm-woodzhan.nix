{ config, pkgs, ... } : {
  home.username = "woodzhan";
  home.homeDirectory = "/home/woodzhan";

  imports = [
    ./hm-wood_common.nix
  ];

  programs.git = {
    userName = "Wood Zhan";
    userEmail = "woodzhan@truelight.com.tw";
 };
}
