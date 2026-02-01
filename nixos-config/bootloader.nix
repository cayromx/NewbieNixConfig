  { config, ... }:
  #Limine Bootloader
  {
  boot = {
    loader.limine.enable = true;
    loader.limine.efiSupport = true;
    };
  }
