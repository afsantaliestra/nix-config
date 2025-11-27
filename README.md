# Nix Config

[![NixOS 25.05](https://img.shields.io/badge/NixOS-25.05-blue.svg?logo=nixos)](https://nixos.org) [![Built with Nix Flakes](https://img.shields.io/badge/Built%20with-Nix%20Flakes-5277C3.svg?logo=nixos)](https://nixos.wiki/wiki/Flakes) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

My NixOS configuration using Nix flakes.

## Overview

| Host    | System       | Version | Description                                        |
| ------- | ------------ | ------- | -------------------------------------------------- |
| laia    | NixOS        | 25.05   | NixOS configuration for my home server             |
| lindsey | NixOS        | 25.05   | NixOS configuration for my dell xps laptop         |
| kalina  | NixOS        | 25.05   | NixOS configuration for my chuwi minibook x laptop |
| wsl     | NixOS        | 25.05   | NixOS configuration for WSL 2                      |
| debian  | Home Manager | 25.05   | Home Manager standalone on Debian/Ubuntu           |

## Project Structure

- `hosts/`: Host-specific configurations
- `modules/`: Reusable Home Manager and NixOS modules
- `users/`: User-specific configurations
- `overlays/`: Nix package overlays

## Installation

### NixOS WSL

**Prerequisites:** Windows 10 2004+ or Windows 11, WSL 2 enabled

1. [Install NixOS WSL](https://github.com/nix-community/NixOS-WSL) and update:

   ```shell
   sudo nix-channel --update && sudo nixos-rebuild switch
   ```

2. Clone this repository:

   ```shell
   cd ~ && nix-shell -p git --run "git clone https://github.com/afsantaliestra/nix-config.git" && cd ~/nix-config
   ```

3. Apply configuration:

   ```shell
   sudo nixos-rebuild boot --flake ./#wsl
   ```

   > **⚠️ Important**: Use `boot` instead of `switch`. According to the [official docs](https://nix-community.github.io/NixOS-WSL/how-to/change-username.html), `switch` may misconfigure the new user account.

4. Restart WSL (PowerShell):

   ```powershell
   wsl -t nixos
   wsl -d nixos --user root exit
   wsl -t nixos
   ```

5. Move repository and cleanup:

   ```shell
   cp -r /home/nixos/nix-config /home/necros/nix-config && sudo rm -rf /home/nixos
   ```

6. **Docker (optional)**: Enable WSL integration in Docker Desktop → Settings → Resources → WSL Integration. [Docs](https://docs.docker.com/desktop/features/wsl/)

### Debian / Ubuntu

1. Install dependencies and Nix:

   ```bash
   sudo apt update && sudo apt upgrade -y && sudo apt install -y curl xz-utils
   sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
   ```

   > **⚠️ Restart your shell**

2. Install Home Manager and enable flakes:

   ```bash
   nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager
   nix-channel --update && nix-shell '<home-manager>' -A install
   mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
   ```

3. Clone and apply configuration:

   ```bash
   cd ~ && nix-shell -p git --run "git clone https://github.com/afsantaliestra/nix-config" && cd nix-config
   home-manager switch --flake ./#debian
   ```

4. Set Zsh as default shell:

   ```bash
   sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
   ```

   > **⚠️ Restart your shell**

5. **Docker (optional)**: Enable WSL integration in Docker Desktop and run `sudo usermod -aG docker $USER`. [Docs](https://docs.docker.com/desktop/features/wsl/)

## Usage

### Updating Configuration

**NixOS laia:**

```shell
cd ~/nix-config && sudo nixos-rebuild switch --flake ./#laia
```

**NixOS WSL:**

```shell
cd ~/nix-config && sudo nixos-rebuild switch --flake ./#wsl
```

**Debian/Ubuntu:**

```shell
cd ~/nix-config && home-manager switch --flake ./#debian
```

### Makefile Commands

- `make` - Format and rebuild based on hostname
- `make fmt` - Format Nix code with Alejandra
- `make laia` - Format and rebuild NixOS
- `make wsl` - Format and rebuild NixOS WSL
- `make debian` - Format and rebuild Home Manager

## Troubleshooting

**System won't boot:** Rollback with `wsl -d NixOS --user root` then `nixos-rebuild switch --rollback`

**Docker permission denied:** Run `sudo usermod -aG docker $USER` and restart your session

**Flakes not enabled:** Add `experimental-features = nix-command flakes` to `~/.config/nix/nix.conf`

## License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.
