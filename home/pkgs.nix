{ config, pkgs, ... }: {
  home.username = "garonfok";
  home.homeDirectory = "/home/garonfok";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    bat
    btop
    eza
    fastfetch
    fd
    fzf
    gcc
    jq
    lazygit
    ripgrep
    tmux
    tree
    unzip
    vesktop
    vlc
    wget
    zathura
    zoxide
  ];
  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  imports = [
    ./dms.nix
    ./fish.nix
    ./git.nix
    ./librewolf.nix
    ./neovim.nix
    ./kitty.nix
  ];
}

