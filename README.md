# Nix Config

This is my Nix Flakes with Home Manager configuration for Debian (WSL).

## Prerequisites

- WSL2 enabled on Windows
- Debian WSL installed: `wsl --install Debian`

## Setup Debian WSL

1. **Configure WSL settings** by editing `/etc/wsl.conf`:

```ini
[boot]
systemd=true

[user]
default=your_user

[network]
hostname=your_hostname
generateHosts=true
generateResolvConf=true
```

> **⚠️ WSL Restart Required**

2. **Update system packages** and install dependencies required for Nix installation:

```bash
sudo apt update && sudo apt upgrade -y && sudo apt install -y curl xz-utils
```

3. **Install Nix package manager** using the official multi-user installation script:

```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

> **⚠️ WSL Restart Required**

4. **Add Home Manager channel** and install it for user environment management:

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager && nix-channel --update && nix-shell '<home-manager>' -A install
```

5. **Enable Nix flakes support** by creating configuration directory and enabling experimental features:

```bash
mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

6. **Configure your personal details** by editing `nix/config.nix`:

```nix
{
  hostname = "your-hostname";
  user = {
    username = "your-username";
    fullName = "Your Full Name";
    email = "your-email@example.com";
  };
}
```

7. **Apply the configuration** using Home Manager with the debian profile:

```bash
home-manager switch --flake ./nix#debian
```

8. **Set Zsh as default shell** by adding it to allowed shells and changing user's default shell:

```bash
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)
```

> **⚠️ Shell Restart Required**
