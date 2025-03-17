{ config, lib, ... }: {

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bella = {
    isNormalUser = true;
    description = "Bella Tsai";
    extraGroups = [ ];
  };
}
