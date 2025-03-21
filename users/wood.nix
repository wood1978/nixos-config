{
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.wood = {
		isNormalUser = true;
		description = "Wood Chan";
		extraGroups = [ "dialout" "networkmanager" "wheel" ];
	};
}
