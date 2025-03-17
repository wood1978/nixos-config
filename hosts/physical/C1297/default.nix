# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # hosts/physical
      ../default.nix
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "C1297"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.extraHosts = ''
    10.1.1.24 tlerp.truelight.com.tw
    10.1.3.44 openproject.truelight.com.tw
    10.1.3.50 tsdb.truelight.com.tw
    10.1.3.51 haos.truelight.com.tw
  '';

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    dispatcherScripts = [ 
      {
        source = pkgs.writeText "VPN-WoodHome-Up" ''
          #!/usr/bin/env ${pkgs.bash}/bin/bash

          DEVICE=''${1}
          STATE=''${2}
          VPN_CON_NAME="WoodHome"
          TUN_CON_NAME="tun0"
          WIRED_CON_NAME="WAN_TL"

          #logger "$(date +"%F %T") Called with ($*) and connection uuid is: ''${CONNECTION_UUID} "

          [[ -z ''${CONNECTION_UUID} ]] && exit 0
          [ "$DEVICE" != "$TUN_CON_NAME" ] && exit 0
          [ "$STATE" != "up" ] && exit 0
          if ${pkgs.networkmanager}/bin/nmcli con show --active | grep ''${VPN_CON_NAME}; then
            #logger "$(date +"%F %T") Con Status:"
            #logger "$(${pkgs.networkmanager}/bin/nmcli con show --active)"
            ${pkgs.networkmanager}/bin/nmcli con up $WIRED_CON_NAME;
            #logger "$(date +"%F %T") Con Status:"
            #logger "$(${pkgs.networkmanager}/bin/nmcli con show --active)"
          fi

        '';
        type = "basic";
      }
      {
        source = pkgs.writeText "WiFi-Up" ''
          #!/usr/bin/env ${pkgs.bash}/bin/bash
          
	  DEVICE=''${1}
          STATE=''${2}
          CWD=$(dirname "$0")
          WIRED_CON_NAME="WAN_TL"
          WIFI_CON_NAME="wlp0s20f0u7"
          UUID="06397a46-4b5c-4d8a-8fcf-4e36699e219b"

          #logger "$(date +"%F %T") Called with ($*) and connection uuid is: ''${CONNECTION_UUID} "

          [[ -z ''${CONNECTION_UUID} ]] && exit 0
          [ "$DEVICE" != "$WIFI_CON_NAME" ] && exit 0
          [ "$CONNECTION_UUID" != "$UUID" ] && exit 0

          #logger "$(date +"%F %T") Con Status:"
          #logger "$(${pkgs.networkmanager}/bin/nmcli con show --active)"
          ${pkgs.networkmanager}/bin/nmcli con down $WIRED_CON_NAME
          #logger "$(date +"%F %T") Con Status:"
          #logger "$(${pkgs.networkmanager}/bin/nmcli con show --active)"
	'';
	type = "pre-up";
      }
    ];
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 24800 ];

  #hardware.bluetooth.enable = true; # enables support for Bluetooth
  #hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # List services that you want to enable:
  # Enable bluetooth service
  #services.blueman.enable = true;
}


