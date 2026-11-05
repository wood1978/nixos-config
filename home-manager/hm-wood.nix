{
  home.username = "wood";
  home.homeDirectory = "/home/wood";

  imports = [
    ./hm-wood_common.nix
    ./desktop/prismlauncher.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      startup = [
        { command = "nm-applet --indicator"; }
      ];
      gaps = {
        inner = 4;
        outer = 2;
      };
    };
    extraConfig = ''
      bindsym Mod4+Return exec alacritty
      bindsym Mod4+Shift+q kill
      bindsym Mod4+d exec wofi --show drun
      bindsym Mod4+Shift+c reload
    '';
    xwayland = true;
  };

  programs.bash.profileExtra = ''
    if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec sway
    fi
  '';

  programs.git.settings.user = {
    name = "Wood Chan";
    email = "ShihHsien.Chan@gmail.com";
  };
}
