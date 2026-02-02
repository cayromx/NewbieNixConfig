{ config, lib, ... }: 

{ 

networking.networkmanager = { 
  enable = true; 
  wifi.powersave = false;
  insertNameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" "8.8.4.4" ];
  };

networking.hostName = "NixOS"; #define your hostname
networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.
# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

#Networkd waiting - useless
systemd.network.wait-online.enable = false;
systemd.network.enable = false;

#Useless systemd network services - turn them off
systemd.services.network-online.enable = false;
systemd.services.NetworkManager-wait-online.enable = false;

}
