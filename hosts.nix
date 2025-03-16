{ config, pkgs, ... }:

{ networking.extraHosts = ''
192.168.0.22    homeassistant.locale
'';
}

