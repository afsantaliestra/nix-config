# Nix Config

My NixOS configuration using nix flakes.

## Overview

| Host | Description                |
| ---- | -------------------------- |
| wsl  | NixOS config used on WSL 2 |

## WSL

The following commands will result in a **WSL NixOS 25.05** installation configured with:

- A custom user (**necros** by default).
- **VSCode** support with **nix-ld** enabled.
- **Docker** integration enabled.
- **pkgs** with both **stable-25.05** and **unstable**.
- **experimental-features = ["nix-command" "flakes"]**.

### Usage

1. Install NixOS WSL by following the official documentation -> [NixOS WSL GitHub](https://github.com/nix-community/NixOS-WSL)

2. Update and rebuild the system.

```shell
sudo nix-channel --update && sudo nixos-rebuild switch
```

3. Download this repository.

```shell
cd ~ && nix-shell -p git
git clone https://github.com/afsantaliestra/nix-config.git && cd ~/nix-config
```

4. Update the configuration with your information

- Create your own users in the `users/` folder.
  - Copy the `users/necros` folder and configure it appropriately.
- Update `modules/nixos/options.nix` with your user options.
- Edit `flake.nix`:
  - Set up the `defaultUser` to your user.
  - Add the new users to `extraUsers` in `flake.nix` in the `wsl` configuration.

5. Rebuild the system again with **boot** instead of switch.

```shell
sudo nixos-rebuild boot --flake ./#wsl
```

6. In Windows PowerShell, restart the WSL subsystem using:

```powershell
wsl -t NixOS
wsl -d NixOS --user root exit
wsl -t NixOS
```

7. The system is now configured and working. Final notes:

- **Docker** is enabled but you must integrate it manually in **Docker Desktop**.
- The `nix-config` is in `/home/nixos`, the home of a user that does not exist anymore. You can copy it to your user and delete the home with something like:

```shell
cp -r /home/nixos/nix-config /home/necros/nix-config && sudo rm -rf /home/nixos
```
