{ config, pkgs, ... } : {
  home.username = "wood";
  home.homeDirectory = "/home/wood";

  programs.git = {
    userName = "Wood Chan";
    userEmail = "ShihHsien.Chan@gmail.com";
  };
}
