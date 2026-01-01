{
  home.username = "wood";
  home.homeDirectory = "/home/wood";

  imports = [
    ./hm-wood_common.nix
    ./desktop/prismlauncher.nix
  ];

  programs.git.settings.user = {
    name = "Wood Chan";
    email = "ShihHsien.Chan@gmail.com";
  };
}
