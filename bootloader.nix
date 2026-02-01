  { config, ... }:
  #Limine Bootloader
  {
  boot = {
    loader.limine.enable = true;
    loader.limine.efiSupport = true;
    loader.efi.canTouchEfiVariables = true;
  #sysctl parameters
  kernel.sysctl = {
    "vm.swappiness" = 10; 
    "vm.max_map_count" = 2147483642;  
    "kernel.sched_cfs_bandwith_slice_us" = 3000;  
    };
  #Kernel Parameters
  kernelParams = [ "nohibernate" "mitigations=off" "split_lock_detect=off" ];
  }; 
 #ZRAM settings
  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 50;
    };



  }
