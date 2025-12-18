# NixOS configuration

## Requirements

- NixOS v25.11

## Installation

1. Edit the NixOS configuration file:

```bash
sudo nano /etc/nixos/configuration.nix
```

2. Modify or add to the existing configuration:

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];

environment.systemPackages = with pkgs; [ git ];
```


3. Rebuild the new configuration:

```bash
sudo nixos-rebuild switch
```

4. Navigate to the home directory and pull the repository

```bash
cd
git clone https://github.com/garonfok/nixos-config
```

5. Navigate into the directory and build the flakes

```bash
cd nixos-config
sudo nixos-rebuild switch --flake
```
