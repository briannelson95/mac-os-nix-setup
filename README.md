# macos-nix-setup

Declarative macOS system configuration using nix-darwin and Nix flakes.

## Usage

### First-time setup:

1. Install Nix:

```bash
curl -L https://nixos.org/nix/install | sh
```

2. Clone this repo:

```bash
git clone https://github.com/briannelson95/mac-os-nix-setup.git
```

3. Run the instlal script

```bash
./install.sh
```

## Features:
- [x] Homebrew apps: Google Chrome, Zoom
- [x] System preferences
- [x] Finder & Dock settings
- [x] Menu extras
- [x] Architecture auto-detection (Intel & Apple Silicon)

