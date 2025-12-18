{ config, lib, pkgs, ... }: {

  imports = [ ./hardware.nix ];

  # Boot
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # Networking
  networking = {
    hostName = "riley";
    networkmanager = {
      enable = true;
    };
  };
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Services
  services = {
    openssh.enable = true;
    # Pipewire audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    upower.enable = true;
  };

  programs.hyprland.enable = true;

  virtualisation.docker = {
    enable = true;
  };

  # User account
  users.users.garonfok = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  
    ignoreShellProgramCheck = true;
    shell = pkgs.fish;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    ibm-plex
  ];

  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  system.stateVersion = "25.11";
}
