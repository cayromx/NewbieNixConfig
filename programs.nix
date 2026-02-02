  { config, pkgs, ... }: 

       {
         environment.systemPackages = with pkgs; [
         vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by defa>
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
         
         ]; 


         programs = {
         steam = {
           enable = true;
           protontricks.enable = true;  
          };
         gamemode.enable = true;
         };
          
	}
