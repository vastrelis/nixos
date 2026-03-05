{ config, lib, pkgs, ... }:

{
  hardware.cpu.amd.updateMicrocode = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
}
