{ config, lib, pkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;
  boot.initrd.kernelModules = [ "i915" ];
}