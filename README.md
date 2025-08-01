# Nix Config

This is my Nix Flakes with Home Manager configuration for NixOS and Debian (WSL).

## Debian WSL

### Prerequisites

- WSL2 enabled on Windows
- Debian WSL installed: `wsl --install Debian`

### Setup

1. **Update system packages** and install dependencies required for Nix installation:

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install -y curl xz-utils
```

2. **Install Nix package manager** using the official multi-user installation script:

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

> **⚠️ Shell Restart Required**

3. **Add Home Manager channel** and install it for user environment management:

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager && nix-channel --update && nix-shell '<home-manager>' -A install
```

4. **Enable Nix flakes support** by creating configuration directory and enabling experimental features:

```bash
mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

5. **Download this repository** with a nix temporal shell to use git:

```bash
nix-shell -p git --run "git clone https://github.com/afsantaliestra/nix-config" && cd nix-config
```

6. **Configure your personal details** by editing `nix/config.nix`:

```nix
{
  user = {
    username = "your-username";
    fullName = "Your Full Name";
    email = "your-email@example.com";
  };
}
```

7. **Apply the configuration** using Home Manager with the debian profile:

```bash
home-manager switch --flake ./#debian
```

8. **Set Zsh as default shell** by adding it to allowed shells and changing user's default shell:

```bash
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
```

> **⚠️ Shell Restart Required**

## NixOS

**wip**

## Development Shells

In the folder of your project create a `.envrc` file with the following content:

```text
# Use from github directly
use flake github:afsantaliestra/nix-config

# Use from local
use flake ~/nix-config
```

Then activate it inside the folder with (only the first time):

```bash
dienv allow
```

Environment shells:

- default
- python312
- python313
- python314
