  { config, pkgs, unstable, ... }: 

       {
         environment.systemPackages = with pkgs; [
         vim 
         wget
         git
         btop
         discord
         easyeffects
         fastfetch
         lact
         goverlay
         mangohud
         tree 
         unzip
         qemu
         virt-manager
         libvirt
         ]; 
        
         nixpkgs.config.permittedInsecurePackages = [ 
           "ciscoPacketTracer8-8.2.2"
         ];

           
         programs = {
         steam = {
           enable = true;
           protontricks.enable = true;  
          };
         gamemode.enable = true;
         };
          
	}
