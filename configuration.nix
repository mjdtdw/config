{ config, pkgs, ... }: {
  imports = [  ./hardware-configuration.nix  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "ru_RU.UTF-8";
  };
  time.timeZone = "Europe/Moscow";
  
  networking.networkmanager.enable = true;
  nixpkgs.config = {
    allowUnfree = true;
    firefox.enableAdobeFlash = true;
  };

  hardware.pulseaudio.enable = true;
  sound.enable = true;
  
  services.xserver = {
    enable = true;
    layout = "us, ru";
    xkbOptions = "grp:ctrl_shift_toggle,grp_led:scroll";
    libinput.enable = true;
    
    desktopManager.xfce.enable = true;
    displayManager.lightdm = {
      enable = true;
      autoLogin.enable = true;
      autoLogin.user = "mjdtdw";
    };
  };
  system.stateVersion = "18.03";

  environment.systemPackages = with pkgs; [
    firefox gparted emacs xfce.xfce4-xkb-plugin
    git idris
  ];

  users.extraUsers.mjdtdw = {
    isNormalUser = true;
    home = "/home/mjdtdw";
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
