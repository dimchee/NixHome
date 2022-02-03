{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.rocm.overlay ];
  networking.hostName = "alvearium";
  networking.interfaces.enp3s0.useDHCP = true;
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  #boot.plymouth.enable = true;
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda"; # or "nodev" for efi only
  };
  
  boot.initrd.availableKernelModules = [
    "ahci" "ohci_pci" "ehci_pci" "pata_atiixp" "firewire_ohci"
    "pata_marvell" "usb_storage" "usbhid" "sd_mod" "sr_mod"
  ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];
  
  # services.printing.enable = true;

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      rocm-opencl-icd # not working see 'dmesg | grep kfd' https://community.amd.com/t5/knowledge-base/amd-rocm-hardware-and-software-support-document/ta-p/489937
      #rocm-runtime-ext # removed in favour of rocm-runtime
      rocm-runtime
      rocm-opencl-runtime
      amdvlk
    ];
    extraPackages32 = with pkgs; [ # only on unstable
      driversi686Linux.amdvlk
    ];
    driSupport32Bit = true;
    driSupport = true;
  };
  # environment.variables.OCL_ICD_VENDORS = with pkgs; "${rocm-opencl-icd}/etc/OpenCL/vendors/";

  # Enable sound.
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    #jack.enable = true;
  };
}
