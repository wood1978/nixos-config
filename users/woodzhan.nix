{ config, lib, ... }: {

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.woodzhan = {
    isNormalUser = true;
    description = "Wood Zhan";
    extraGroups = [ "dialout" "networkmanager" "wheel" ];
  };
}
