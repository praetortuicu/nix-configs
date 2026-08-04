# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./vpn-uni-heidelberg.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  #boot.extraModprobeConfig = ''
  #  options firmware_class.path=${pkgs.linux-firmware}/lib/firmware
  #'';

  # boot.loader.efi.canTouchEfiVariables = true;
  #boot.kernelPackages = pkgs.linuxPackages_6_17;
  #boot.initrd.extraFirmwarePaths = [ "iwlwifi-ma-b0-gf-a0-89.ucode.zst" ];
  hardware.bluetooth.enable = true;

  networking.hostName = "nixla"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  services.resolved.enable = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "systemd-resolved";
  networking.wireless.iwd.enable = true;
  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.fwupd.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    options  = "ctrl:nocaps";
    variant = "altgr-intl";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tuicuimens = {
    isNormalUser = true;
    description = "tuicuimens";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "seat"];
    packages = with pkgs; [];
  };
  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  programs.steam.enable = true;
  programs.zsh.enable  = true;
  zramSwap = {
	enable = true;
	memoryPercent = 50;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ 
  # List packages installed in system profile. To search, run:
  # $ nix search wget
    gcc
    wget
    curl
    mesa
    vulkan-tools
    libdrm
  ];
  services.pcscd.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };
  services.xserver = {
    displayManager.startx.enable = true;
    displayManager.lightdm.enable = true;

    enable = true;
    windowManager.i3.enable = true;
    wacom.enable = true;
  };
  security.pam.services = {
  login.u2fAuth = true;
  sudo.u2fAuth = true;
  lightdm.u2fAuth = true; 
  };
  
  security.pam.u2f.settings = {
    cue = true;           # Tells "Please touch the device"
    interactive = true;   # Required for the prompt to wait
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable the OpenSSH daemon.
  services.printing.enable = false;
  services.openssh.enable = false;

  # Enable mullvad vpn service
  services.mullvad-vpn.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [ "uni-heidelberg" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
