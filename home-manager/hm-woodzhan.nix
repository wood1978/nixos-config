{ config, pkgs, ... } : {
  home.username = "woodzhan";
  home.homeDirectory = "/home/woodzhan";

  programs.git = {
    userName = "Wood Zhan";
    userEmail = "woodzhan@truelight.com.tw";
 };
}
