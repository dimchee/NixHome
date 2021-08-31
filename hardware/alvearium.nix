{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [
    "ahci" "ohci_pci" "ehci_pci" "pata_atiixp" "firewire_ohci"
    "pata_marvell" "usb_storage" "usbhid" "sd_mod" "sr_mod"
  ];
  boot.initrd.kernelModules = [ ];
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
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
      amdvlk
    ];
    # extraPackages32 = with pkgs; [ # only on unstable
    #   driversi686Linux.amdvlk
    # ];
    # driSupport32Bit = true;
    driSupport = true;
  };
  environment.variables.VK_ICD_FILENAMES =
    "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
}
