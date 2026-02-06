{ config, lib, pkgs, ... }: 
{
  hardware = {
    amdgpu.overdrive.enable = true;
    };
}
