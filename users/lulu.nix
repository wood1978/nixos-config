{ config, lib, ... }: {

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lulu = {
    isNormalUser = true;
    description = "LuLu Chan";
    extraGroups = [ ];
  };
}
