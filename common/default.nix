{ pkgs, lib, inputs, config, ... }: {
  # Localization
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  # System packages
  environment.systemPackages = with pkgs; [
    # neovim
  ];

  programs.git.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
      "nix-command"
      "flakes"
  ];
}
